import 'package:flare_parent/Screen/ActivityPage.dart';
import 'package:flare_parent/Screen/ClassRoom.dart';
import 'package:flare_parent/Screen/ContactPage.dart';
import 'package:flare_parent/Screen/AddPostPage.dart';
import 'package:flare_parent/Screen/NotificationPage.dart';
import 'package:flare_parent/Screen/ProfilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle _textStyle;
  Color _color;
  double _height, _width;
  int _activePage = 0;
  GlobalKey _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> _pageIconList = [
  ];

  List<Widget> _pageList = [
    new ClassRoom(),
    new ContactPage(),
    new ActivityPage(),
    new NotificationPage(),
    new ProfilePage(),
  ];
  
  List<Widget> actionIcons = [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.translate),
              onPressed: () {},
            ),
          ];

  @override
  void initState() {
    // _activePage = 0;
    _color = Color(0xff15db99);
    _textStyle = TextStyle(color: _color, fontFamily: 'Poppins',fontWeight: FontWeight.bold);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pageIconList = [
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.import_contacts,
          color: _activePage == 0 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(0,context);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.contacts,
          color: _activePage == 1 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(1,context);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.art_track,
          color: _activePage == 2 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(2,context);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.find_replace,
          color: _activePage == 3 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(3,context);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.notification_important,
          color: _activePage == 4 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(4,context);
        },
      ),
    ];
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Flare: Parent',
              style: TextStyle(color: Colors.black,fontFamily: 'Light',fontWeight: FontWeight.bold)),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: actionIcons,
        ),
        body: _pageList[_activePage],
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            elevation: 4.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _pageIconList,
            ),
          ),
        ));
  }

  void _changePage(int index,BuildContext context) {
    print(index);
    setState(() {
      _activePage = index;
      if(index ==  2)
      {
        actionIcons = [
          MaterialButton(
            color: Colors.transparent,
            child: Text('Add Post',style: TextStyle(color: Colors.blue)),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return new AddPostPage();}));
            },
          ),
        ];
      }
      else
      {
        actionIcons = [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.translate),
              onPressed: () {},
            ),
          ];
      }
    });
  }
}
