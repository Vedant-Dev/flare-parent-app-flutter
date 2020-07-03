import 'package:flare_parent/Models/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassRoom extends StatefulWidget {
  ClassRoom({Key key}) : super(key: key);

  @override
  _ClassRoomState createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  TextStyle _textStyle;
  Color _color;
  int _notification;
  String _noticeText;

  @override
  void initState() {
    _notification = 5;
    String temp = _notification == 0 ? "Notification" : "Notifications";
    _noticeText = "You Have $_notification $temp";
    _color = Color(0xff15db99);
    _textStyle = TextStyle(color: _color, fontFamily: 'Poppins');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Quiz testQuiz = new Quiz('q0001', 'Maths',
        (DateFormat("dd-MM-yyyy").format(new DateTime.now().add(new Duration(days: 10)))), [
      new QuizQuestion('Which is largest organ in human body?',
          ['Pata nahi', 'Sach me', 'Jo Man Lo', 'Me Nahi Janta'], 2),
    ]);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 125),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _smallCard(
                            'assets/images/attend.png', "Attendance", context),
                        _smallCard(
                            'assets/images/result.png', "Exam Result", context),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    _bigCards('assets/images/result.png', testQuiz,context),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _smallCard(
                            'assets/images/attend.png', "Attendance", context),
                        _smallCard(
                            'assets/images/result.png', "Exam Result", context),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _smallCard(
                            'assets/images/attend.png', "Attendance", context),
                        _smallCard(
                            'assets/images/result.png', "Exam Result", context),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Text(
                    _noticeText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallCard(image, title, BuildContext context) {
    return GestureDetector(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        elevation: 4.0,
        child: Container(
          height: 170,
          width: (MediaQuery.of(context).size.width / 2) - 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  image,
                  height: 80,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(title,
                    style: _textStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        print(title);
      },
    );
  }

  Widget _bigCards(image, Quiz subject, BuildContext context) {
    return GestureDetector(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        elevation: 4.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: _color),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${subject.subject} - Weekly Quiz',
                      style: TextStyle(
                          color: _color,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: _color,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Expires On: ${subject.expiresOn}',
                            style: TextStyle(
                                color: _color,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print(subject.subject);
      },
    );
  }
}
