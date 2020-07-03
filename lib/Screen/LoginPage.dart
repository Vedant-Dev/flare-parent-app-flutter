import 'package:flare_parent/Screen/HomePage.dart';
import 'package:flare_parent/background.dart';
import 'package:flutter/material.dart';
import 'package:rich_alert/rich_alert.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background(),
            Login(),
          ],
        ));
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController serialController;

  bool isNotVarified = true;

  @override
  void initState() {
    super.initState();
    serialController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    isNotVarified?"Phone Number":'Enter OTP',
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 40, bottom: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Material(
                          elevation: 10,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(0.0),
                                  topRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 40, right: 20, top: 10, bottom: 10),
                            child: TextField(
                              controller: serialController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: isNotVarified
                                      ? "eg. 9234567890"
                                      : 'eg. 9654',
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                isNotVarified
                                    ? 'Enter Your Phone Number To Login..'
                                    : 'Enter OTP number Sent On Your Phone Number',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xFFA0A0A0), fontSize: 12),
                              ),
                            )),
                            GestureDetector(
                              onTap: () {
                                isNotVarified
                                    ? verifySerial(
                                        serialController.text.toString(),
                                        context)
                                    : verifyOtp(
                                        serialController.text.toString(),
                                        context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  gradient: LinearGradient(
                                      colors: signInGradients,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: ImageIcon(
                                  AssetImage("assets/images/ic_forward.png"),
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
          ],
        )
      ],
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  void verifySerial(String ser, BuildContext context) {
    ser = ser.trim();
    ser = ser.toUpperCase();
    if (ser.length == 10 && isNumeric(ser)) {
      setState(() {
        isNotVarified = false;
        serialController.clear();
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return RichAlertDialog(
              alertTitle: richTitle("Invalid Phone Number"),
              alertSubtitle: richSubtitle("Please Input Valid Phone Number"),
              alertType: RichAlertType.ERROR,
            );
          });
    }
  }

  void verifyOtp(String ser, BuildContext context) {
    ser = ser.trim();
    ser = ser.toUpperCase();
    if (ser.length == 4 && isNumeric(ser)) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return new HomePage();}));
      print('done');
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return RichAlertDialog(
              alertTitle: richTitle("Invalid OTP Number"),
              alertSubtitle: richSubtitle("Please Input Valid OTP Number"),
              alertType: RichAlertType.ERROR,
            );
          });
    }
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("images/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
