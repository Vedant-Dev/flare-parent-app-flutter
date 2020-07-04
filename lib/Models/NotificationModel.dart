class NotificationModel {
  final String title;
  final String subTitle;
  final String type;

  NotificationModel(this.title, this.subTitle, this.type);
}

class NotificationModelType {
  static const EXAM_ALERT = '0';
  static const RESULT_ALERT = '1';
  static const NORMAL = '2';
  static const COMPLAIN = '3';
  static const INFO = '4';
}
