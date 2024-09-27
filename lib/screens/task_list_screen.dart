import 'package:flutter/material.dart';
import 'package:thuctap/screens/add_task_screen.dart';
import 'package:thuctap/screens/task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen();

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> tasks = [
    {'content': 'Nhiệm vụ 1', 'ngày': '23/09/2024', 'giờ': '8h -> 11h'},
    {'content': 'Nhiệm vụ 2', 'ngày': '24/09/2024', 'giờ': '13h -> 15h'},
    {'content': 'Nhiệm vụ 3', 'ngày': '25/09/2024', 'giờ': '9h -> 12h'}
  ];

  Future<void> _addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTaskScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        tasks.add({
          'content': result['content'],
          'ngày': result['date'],
          'giờ': result['time'],
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách nhiệm vụ'),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addTask,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tasks.isNotEmpty
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        task['content'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            'Ngày: ${task['ngày']}',
                            style: TextStyle(
                              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Giờ: ${task['giờ']}',
                            style: TextStyle(
                              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailScreen(task: task),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            tasks[index] = {
                              'content': result['content'],
                              'ngày': result['ngày'],
                              'giờ': result['giờ'],
                            };
                          });
                        }
                      },
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'Chưa có nhiệm vụ nào',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                ),
              ),
      ),
    );
  }
}
