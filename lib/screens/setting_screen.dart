import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuctap/configs/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isReminderEnabled = false; // Trạng thái cho thông báo nhắc nhở

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SwitchListTile(
                title: const Row(
                  children: [
                    Icon(Icons.brightness_6, color: Colors.grey), // Icon Dark/Light Mode
                    SizedBox(width: 10),
                    Text(
                      'Chế độ tối',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
                activeColor: const Color(0xffB81736),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Chọn chế độ phù hợp với bạn!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Bạn có thể thay đổi giữa chế độ sáng và chế độ tối để dễ dàng hơn trong việc sử dụng ứng dụng.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SwitchListTile(
                title: const Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.grey), 
                    SizedBox(width: 10),
                    Text(
                      'Thông báo nhắc nhở',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                subtitle: const Text(
                  'Bật thông báo để nhắc nhở bạn về các nhiệm vụ quan trọng',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                value: isReminderEnabled,
                onChanged: (value) {
                  setState(() {
                    isReminderEnabled = value;
                  });
                },
                activeColor: const Color(0xffB81736),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cài đặt nhắc nhở:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Thời gian nhắc nhở trước nhiệm vụ (phút)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
