import 'dart:io';
import 'dart:math';

import 'package:flare_parent/Models/Post.dart';
import 'package:flare_parent/Models/TestModels.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

AddPostPageState pageState;

class AddPostPage extends StatefulWidget {
  @override
  AddPostPageState createState() {
    pageState = AddPostPageState();
    return pageState;
  }
}

class AddPostPageState extends State<AddPostPage> {
  File _image;
  final picker = ImagePicker();
  bool isLoading = false;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Post',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Light',
                  fontWeight: FontWeight.bold)),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: !isLoading
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 300,
                        height: 300,
                        child: (_image != null)
                            ? Image.file(_image)
                            : Placeholder(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Gallery"),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                          ),
                          RaisedButton(
                            color: Colors.orange,
                            textColor: Colors.white,
                            child: Text("Camera"),
                            onPressed: () {
                              getImage(ImageSource.camera);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: _controller,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            hintText: "Aa"),
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: _image != null
                ? () {
                    addPost(context);
                  }
                : null));
  }

  void getImage(ImageSource source) async {
    var image = await picker.getImage(source: source);

    setState(() {
      _image = File(image.path);
    });
  }

  addPost(BuildContext context) {
    setState(() {
      isLoading = true;
    });
    Random random = new Random();
    String randomId = (random.nextInt(9999) + random.nextInt(9999)).toString();
    Post newPost = new Post(
        randomId,
        TestModels.testImageUrl,
        (new DateFormat('dd:MM:yyyy').format(new DateTime.now()))
            .toString()
            .replaceAll(':', '/'),
        _controller.text != null
            ? _controller.text.toString()
            : 'Hello, friends!',
        TestModels.currentStudent,
        [],
        []);
    List<Post> allPosts = TestModels.posts;
    allPosts.insert(0, newPost);
    TestModels.posts = allPosts;
    Navigator.of(context).pop();
  }
}
