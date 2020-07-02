import 'package:flare_parent/Models/Student.dart';

class Post{
  final String pID,url,date,dics;
  final Student uploader;  
  final List<Student> likes;
  final List<Comment> comments;

  Post(this.pID, this.url, this.date,this.dics, this.uploader, this.likes, this.comments);

}

class Comment{
  final String comment;
  final Student user;
  final String date,time;
  final List<Reply> replies;

  Comment(this.comment,this.user, this.date, this.time, this.replies);
}

class Reply{
  final Student user;
  final String date,time;

  Reply(this.user, this.date, this.time);
}