import 'package:flare_parent/Models/Message.dart';
import 'package:flare_parent/Models/NotificationModel.dart';
import 'package:flare_parent/Models/Post.dart';
import 'package:flare_parent/Models/Student.dart';

class TestModels {
  static String testImageUrl =
      "https://image.shutterstock.com/image-photo/double-exposure-image-business-man-260nw-769705507.jpg";

  static Student currentStudent = new Student(
      testImageUrl,
      "40",
      'S3921',
      "Vedant Singh",
      "11",
      'C',
      'Mr. Singh',
      'Mrs. Singh',
      '16-11-2003',
      '1234567890', [], [], [
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
    new NotificationModel('dwhfbxhjwebfh', 'wdhbchjwx'),
  ]);

  static Student testStudent = new Student(
      testImageUrl,
      "23",
      'S4324',
      "Jonny Sins",
      "11",
      'c',
      'Mr. Sin',
      'Mrs. Sin',
      '14-12-2003',
      '7894561230', [], [], []);

  static List<Post> posts = [
    new Post(
        'p0001', testImageUrl, '01-07-2020', 'This is Message', testStudent, [
      testStudent,
      testStudent
    ], [
      Comment('This is Test Comment', testStudent, '22-22-1784', '04:55', [])
    ]),
    new Post('p0001', testImageUrl, '01-07-2020', 'This is Message',
        testStudent, [], [
      Comment('This is Test Comment', testStudent, '22-22-1784', '04:55', [])
    ]),
    new Post(
        'p0001', testImageUrl, '01-07-2020', 'This is Message', testStudent, [
      testStudent,
      testStudent,
      testStudent,
      testStudent
    ], [
      Comment('This is Test Comment', testStudent, '22-22-1784', '04:55', [])
    ]),
  ];

  static List<Message> messages = [
    new Message('Please Reply Bro!!', '04:05', testStudent, ''),
    new Message('What\s Up Bro', '04:05', testStudent, ''),
    new Message('Hi', '04:05', testStudent, ''),
  ];
}
