import 'package:flare_parent/Models/NotificationModel.dart';
import 'package:flare_parent/Models/Quiz.dart';

class Student
{
  final String photoUrl;
  final String rollNumber;
  final String sID;
  final String name;
  final String classOfStudent;
  final String section;
  final String fathersName;
  final String mothersName;
  final String dob;
  final String phoneNumber;
  final List<Quiz> completed,notCompleted;
  final List<NotificationModel> notifications;

  Student(this.photoUrl, this.rollNumber, this.sID, this.name, this.classOfStudent, this.section, this.fathersName, this.mothersName, this.dob, this.phoneNumber, this.completed, this.notCompleted, this.notifications);
}