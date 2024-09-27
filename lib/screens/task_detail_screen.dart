import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  final Map<String, dynamic> task; // Nhận nhiệm vụ từ màn hình trước

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late String content;
  late String date;
  late String time;

  @override
  void initState() {
    super.initState();
    content = widget.task['content'];
    date = widget.task['ngày'];
    time = widget.task['giờ'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết nhiệm vụ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context, {
                'content': content,
                'ngày': date,
                'giờ': time,
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nội dung'),
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
              controller: TextEditingController(text: content),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Ngày'),
              onChanged: (value) {
                setState(() {
                  date = value;
                });
              },
              controller: TextEditingController(text: date),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Giờ'),
              onChanged: (value) {
                setState(() {
                  time = value;
                });
              },
              controller: TextEditingController(text: time),
            ),
          ],
        ),
      ),
    );
  }
}
