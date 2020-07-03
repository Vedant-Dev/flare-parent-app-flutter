import 'package:flare_parent/Models/Message.dart';
import 'package:flare_parent/Models/Student.dart';
import 'package:flare_parent/Models/TestModels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String text;
  TextEditingController _controller;
  TextStyle _textStyle;
  Color _color;

  Student currentStudent, testStudent;
  List<Message> messages;

  @override
  void initState() {
    _color = Color(0xff15db99);
    _textStyle = TextStyle(color: _color, fontFamily: 'Poppins');
        
    currentStudent = TestModels.currentStudent;
    testStudent = TestModels.testStudent;
    messages = TestModels.messages;

    super.initState();
    _controller = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0);
            },
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              Message m = messages[index];
              if (m.sender.sID == currentStudent.sID)
                return _buildMessageRowCurrent(m);
              return _buildMessageRow(m);
            },
          ),
        ),
        _buildBottomBar(context),
      ],
    );
  }

  Container _buildBottomBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.send,
              controller: _controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Aa"),
              onEditingComplete: _save,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _save,
          )
        ],
      ),
    );
  }

  _save() async {
    if (_controller.text.isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      messages.insert(
          0,
          Message(
              _controller.text,
              new DateFormat("H:m:s")
        .format(new DateTime.now()),
              currentStudent,
              ''));
      _controller.clear();
    });
  }

  Widget _buildMessageRow(Message message) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(message.sender.photoUrl),
          radius: 20.0,
        ),
        SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${message.sender.name}",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .6),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text(
                "${message.msg}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(width: 15),
        Text(
          "${message.time}",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMessageRowCurrent(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You    ${message.time}",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .6),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Text(
                "${message.msg}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
