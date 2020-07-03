import 'package:flare_parent/Models/NotificationModel.dart';
import 'package:flare_parent/Models/Student.dart';
import 'package:flare_parent/Models/TestModels.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<NotificationModel> notifications;

  @override
  void initState() { 
    super.initState();
    Student _currentStudent = TestModels.currentStudent;
    notifications = _currentStudent.notifications;
  }
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return new Container(
      margin: EdgeInsets.only(left: 5.0,right: 5.0),
      child: new ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ListTile(
                  title: Text(notifications[index].title.toString()),
                  subtitle: Text(notifications[index].subTitle.toString()),
                ),
              ],
            ));
          }),
    );
  }
}