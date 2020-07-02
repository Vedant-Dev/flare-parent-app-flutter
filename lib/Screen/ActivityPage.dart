import 'package:flare_parent/Models/Post.dart';
import 'package:flare_parent/Models/Student.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Post> posts;

  @override
  void initState() {
    String testProfile =
        "https://image.shutterstock.com/image-photo/double-exposure-image-business-man-260nw-769705507.jpg";
    Student testStudent = new Student(testProfile, "40", 'S1234', "John Doe",
        "11", 'c', 'farmer doe', 'miss doe', '12-6-2020', '1234567890', [], []);
    posts = [
      new Post(
          'p0001',
          testProfile,
          '01-07-2020',
          testStudent,
          [testStudent, testStudent],
          [Comment(testStudent, '22-22-1784', '04:55:65', [])]),
          new Post(
          'p0001',
          testProfile,
          '01-07-2020',
          testStudent,
          [],
          [Comment(testStudent, '22-22-1784', '04:55:65', [])]),
          new Post(
          'p0001',
          testProfile,
          '01-07-2020',
          testStudent,
          [testStudent, testStudent,testStudent,testStudent],
          [Comment(testStudent, '22-22-1784', '04:55:65', [])]),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                new NetworkImage(posts[index].uploader.photoUrl)),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      posts[index].uploader.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                new IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: null,
                )
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: new Image.network(
              posts[index].url,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                          ),
                          onPressed: () {
                            print("like");
                          }),
                      new SizedBox(
                        width: 16.0,
                      ),
                      new IconButton(
                          icon: Icon(
                            Icons.comment,
                          ),
                          onPressed: () {
                            print("comment");
                          }),
                      new SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${posts[index].likes.length.toString()} likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: new TextField(
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add a comment...",
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.send), onPressed: (){}),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(posts[index].date, style: TextStyle(color: Colors.grey)),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}