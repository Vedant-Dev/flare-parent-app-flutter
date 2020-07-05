import 'package:flare_parent/Models/Student.dart';
import 'package:flare_parent/Models/TestModels.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // List<Student> numberAssociated;
  // bool _selected = false;
  // Student selectedStudent;

  @override
  void initState() {
    // numberAssociated = [
    //   TestModels.currentStudent,
    //   TestModels.testStudent,
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _kid(TestModels.currentStudent);
  }

  // Widget _askKid(BuildContext context) {
  //   ListView.builder(
  //       itemCount: numberAssociated.length,
  //       itemBuilder: (context, index) {
  //         return Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             SizedBox(height: 150),
  //             GestureDetector(
  //               child: Material(
  //                 elevation: 20,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.all(Radius.circular(30)),
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           CircleAvatar(
  //                             backgroundImage: NetworkImage(
  //                                 numberAssociated[index].photoUrl),
  //                           ),
  //                           Text(numberAssociated[index].name)
  //                         ],
  //                       ),
  //                       Text(numberAssociated[index].sID),
  //                       Text(
  //                           '${numberAssociated[index].classOfStudent} - ${numberAssociated[index].section}'),
  //                       Text(numberAssociated[index].fathersName),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               onTap: () {
  //                 selectedStudent = numberAssociated[index];
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }

  Widget _kid(Student student) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              student.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 96.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  student.name,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(student.classOfStudent),
                                  subtitle: Text(student.sID),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(student.photoUrl),
                              fit: BoxFit.cover)),
                      margin: EdgeInsets.only(left: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("User information"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Father's Name"),
                        subtitle: Text(student.fathersName),
                        leading: Icon(Icons.email),
                      ),
                      ListTile(
                        title: Text("Mother's Name"),
                        subtitle: Text(student.mothersName),
                        leading: Icon(Icons.phone),
                      ),
                      ListTile(
                        title: Text("Date Of Birth"),
                        subtitle: Text(student.dob),
                        leading: Icon(Icons.web),
                      ),
                      ListTile(
                        title: Text("Phone Number"),
                        subtitle: Text(student.phoneNumber),
                        leading: Icon(Icons.person),
                      ),
                      ListTile(
                        title: Text("Number Of Quiz Taken"),
                        subtitle: Text(student.completed.length.toString()),
                        leading: Icon(Icons.done_outline),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
