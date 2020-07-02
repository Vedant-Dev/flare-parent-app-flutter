import 'package:flare_parent/Models/Student.dart';

class Message
{
  final String msg;
  final String time;
  final Student sender;
  final String tag;

  Message(this.msg, this.time, this.sender, this.tag);

}