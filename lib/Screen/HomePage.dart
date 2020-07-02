import 'package:flare_parent/Screen/ActivityPage.dart';
import 'package:flare_parent/Screen/ClassRoom.dart';
import 'package:flare_parent/Screen/ContactPage.dart';
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
          _changePage(0);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.contacts,
          color: _activePage == 1 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(1);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.art_track,
          color: _activePage == 2 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(2);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.find_replace,
          color: _activePage == 3 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(3);
        },
      ),
      IconButton(
        focusColor: _color,
        icon: Icon(
          Icons.notification_important,
          color: _activePage == 4 ? _color : Colors.grey,
        ),
        onPressed: () {
          _changePage(4);
        },
      ),
    ];
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Flare: Parent',
              style: TextStyle(color: Colors.black,fontFamily: 'Light')),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
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
          ],
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

  void _changePage(int index) {
    print(index);
    setState(() {
      _activePage = index;

    });
  }
}
