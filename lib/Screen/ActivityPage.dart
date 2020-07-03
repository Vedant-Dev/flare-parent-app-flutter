import 'package:flare_parent/Models/Post.dart';
import 'package:flare_parent/Models/Student.dart';
import 'package:flare_parent/Models/TestModels.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Post> testposts;
  Student _currentStudent;

  @override
  void initState() {
    _currentStudent = TestModels.currentStudent;
    testposts = TestModels.posts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _postCard(snapshot.data[index]),
              ],
            ),
          );
        });
  }

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    posts = testposts;
    return posts;
  }

  Widget _postCard(Post post) {
    bool isLiked = false;
    for (int i = 0; i < post.likes.length; i++) {
      if (post.likes[i].sID == _currentStudent.sID) {
        isLiked = true;
        break;
      } else {
        continue;
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  post.uploader.photoUrl.toString(),
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(
                post.uploader.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                post.date,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ),
            Image.network(
              post.url,
              height: 170,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(isLiked
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart),
                    onPressed: () {
                      setState(() {
                        if (!isLiked) {
                          post.likes.add(_currentStudent);
                        } else {
                          post.likes.remove(_currentStudent);
                        }
                      });
                    }),
                Text(
                  '${post.likes.length} Likes',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                IconButton(
                    icon: Icon(FontAwesomeIcons.comment), onPressed: () {}),
                Text(
                  '${post.comments.length} Comments',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${post.uploader.name}: ${post.dics}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                MaterialButton(
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Text('Add Comment',
                        style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return new PostPage(
                            post: post, currentStudent: _currentStudent);
                      }));
                    }),
              ],
            ),
          ],
        ),
        onDoubleTap: () {
          setState(() {
            if (!isLiked) {
              post.likes.add(_currentStudent);
            } else {
              post.likes.remove(_currentStudent);
            }
          });
        },
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return new PostPage(post: post, currentStudent: _currentStudent);
          }));
        },
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  final Post post;
  final Student currentStudent;
  PostPage({Key key, @required this.post, @required this.currentStudent})
      : super(key: key);

  @override
  _PostPageState createState() => _PostPageState(post, currentStudent);
}

class _PostPageState extends State<PostPage> {
  final Post post;
  final Student currentStudent;
  final TextEditingController _commentController = TextEditingController();
  _PostPageState(this.post, this.currentStudent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('${post.uploader.name}\' Post'),
        ),
        body: Column(
          children: [
            Expanded(
              child: buildComments(),
            ),
            Divider(),
            ListTile(
              title: TextFormField(
                controller: _commentController,
                decoration: InputDecoration(labelText: 'Write a comment...'),
              ),
              trailing: OutlineButton(
                onPressed: () {
                  addComment(_commentController.text);
                },
                borderSide: BorderSide.none,
                child: Text("Post"),
              ),
            ),
          ],
        ));
  }

  addComment(String msg) {
    if (_commentController.text != null) {
      Comment comment = new Comment(
          msg,
          currentStudent,
          new DateFormat("dd:MM:yyyy")
              .format(new DateTime.now())
              .replaceAll(':', '/'),
          new DateFormat("H:m:s").format(new DateTime.now()).substring(0, 5),
          []);
      post.comments.insert(0, comment);
      print(comment.date);
      print(comment.time);
      _commentController.clear();
      setState(() {});
    }
  }

  Widget buildComments() {
    return FutureBuilder<List<Comment>>(
        future: getComments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data[index].comment),
                    subtitle: Text(
                      'By ${snapshot.data[index].user.name} on ${snapshot.data[index].date}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].user.photoUrl),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        });
  }

  Future<List<Comment>> getComments() async {
    List<Comment> comments = [];

    comments = post.comments;

    return comments;
  }
}
