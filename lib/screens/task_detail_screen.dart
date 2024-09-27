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
        title: const Text('Chi tiết nhiệm vụ',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Nội dung',
                value: content,
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Ngày',
                value: date,
                onChanged: (value) {
                  setState(() {
                    date = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Giờ',
                value: time,
                onChanged: (value) {
                  setState(() {
                    time = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, {
            'content': content,
            'ngày': date,
            'giờ': time,
          });
        },
        label: const Text(
          'Lưu',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.save,color: Colors.white,),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          controller: TextEditingController(text: value),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
