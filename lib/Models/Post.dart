import 'package:flare_parent/Models/Student.dart';

class Post{
  final String pID,url,date;
  final Student uploader;  
  final List<Student> likes;
  final List<Comment> comments;

  Post(this.pID, this.url, this.date, this.uploader, this.likes, this.comments);

}

class Comment{
  final Student user;
  final String date,time;
  final List<Reply> replies;

  Comment(this.user, this.date, this.time, this.replies);
}

class Reply{
  final Student user;
  final String date,time;

  Reply(this.user, this.date, this.time);
}