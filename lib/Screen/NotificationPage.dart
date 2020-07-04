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
    return Container(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(children: [
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundColor: getColor(notifications[index].type),
              ),
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].subTitle),
            ),
            Divider(),
          ]);
        },
      ),
    );
  }

  Color getColor(String type) {
    Color color;
    switch (type) {
      case NotificationModelType.COMPLAIN:
      case NotificationModelType.EXAM_ALERT:
        color = Colors.red;
        break;
      case NotificationModelType.NORMAL:
      case NotificationModelType.INFO:
        color = Colors.blueGrey;
        break;
      case NotificationModelType.RESULT_ALERT:
        color = Colors.yellow;
        break;
      default:
        color = Colors.blueGrey;
    }
    return color;
  }
}
