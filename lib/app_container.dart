import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctap/configs/theme_provider.dart';
import 'package:thuctap/screens/add_task_screen.dart';
import 'package:thuctap/screens/calender_screen.dart';
import 'package:thuctap/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:thuctap/screens/task_statistics_screen.dart';
import 'package:thuctap/screens/task_list_screen.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> tasks = [];

  int completedTasks = 5;
  int newTasks = 10;
  int inProgressTasks = 3;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      TaskStatisticsScreen(
        completedTasks: completedTasks,
        newTasks: newTasks,
        inProgressTasks: inProgressTasks,
      ),
      const TaskListScreen(),
      const CalenderScreen(),
      const SettingScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
        completedTasks = tasks.where((task) => task['status'] == 'completed').length;
        newTasks++;
        _selectedIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(CupertinoIcons.chart_bar, 'Thống kê', 0, isDarkMode),
            buildNavBarItem(CupertinoIcons.table, 'Việc', 1, isDarkMode),
            const SizedBox(width: 20),
            buildNavBarItem(CupertinoIcons.calendar, 'Lịch', 2, isDarkMode),
            buildNavBarItem(CupertinoIcons.settings, 'Cài đặt', 3, isDarkMode),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffB81736),
                  Color(0xff281537),
                ],
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () async => addTask(),
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  CupertinoIcons.add_circled,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index, bool isDarkMode) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? const Color(0xffB81736)
                : (isDarkMode ? Colors.white : Colors.black87),
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? const Color(0xffB81736)
                  : (isDarkMode ? Colors.white : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
