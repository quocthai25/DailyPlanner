import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TaskStatisticsScreen extends StatelessWidget {
  final int completedTasks;
  final int newTasks;
  final int inProgressTasks;

  TaskStatisticsScreen({
    required this.completedTasks,
    required this.newTasks,
    required this.inProgressTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thống kê công việc',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatisticsCard(
              title: 'Công việc hoàn thành',
              count: completedTasks,
              color: Colors.green,
              icon: Icons.check_circle_outline,
            ),
            const SizedBox(height: 16),
            _buildStatisticsCard(
              title: 'Công việc mới tạo',
              count: newTasks,
              color: Colors.blue,
              icon: Icons.fiber_new,
            ),
            const SizedBox(height: 16),
            _buildStatisticsCard(
              title: 'Công việc đang thực hiện',
              count: inProgressTasks,
              color: Colors.orange,
              icon: Icons.timelapse,
            ),
            const SizedBox(height: 32),
            Text(
              'Biểu đồ thống kê',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark 
                    ? Colors.white 
                    : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.3,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildPieChart(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCard({
    required String title,
    required int count,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: _buildPieChartSections(),
        centerSpaceRadius: 50,
        sectionsSpace: 2,
        borderData: FlBorderData(show: false),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    final totalTasks = completedTasks + newTasks + inProgressTasks;

    return [
      PieChartSectionData(
        color: Colors.green,
        value: completedTasks.toDouble(),
        title: totalTasks > 0
            ? '${((completedTasks / totalTasks) * 100).toStringAsFixed(1)}%'
            : '0%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: newTasks.toDouble(),
        title: totalTasks > 0
            ? '${((newTasks / totalTasks) * 100).toStringAsFixed(1)}%'
            : '0%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: inProgressTasks.toDouble(),
        title: totalTasks > 0
            ? '${((inProgressTasks / totalTasks) * 100).toStringAsFixed(1)}%'
            : '0%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}
