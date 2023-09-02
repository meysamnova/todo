// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {
  String title;
  String subTitle;
  String date;
  String time;
  bool status;
  TaskModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.time,
    required this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'time': time,
      'status': status
    };
  }

  TaskModel.fromJson(Map<String, dynamic> item)
  :title=item['title'],
  subTitle=item['subTitle'],
  date=item['date'],
  time=item['time'],
  status=item['status'];

}
