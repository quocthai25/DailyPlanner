import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _date;
  String _content = '';
  String _time = '';
  String _location = '';
  String _chairperson = '';
  String _notes = '';
  String _status = 'New';
  String _approvalPerson = '';

  final _statuses = ['New', 'In Progress', 'Completed', 'Closed'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _date = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm nhiệm vụ mới'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ListTile(
                title: Text(_date == null ? 'Chọn ngày' : 'Ngày: $_date'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nội dung nhiệm vụ'),
                onChanged: (value) => _content = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung nhiệm vụ';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Thời gian'),
                onChanged: (value) => _time = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Vị trí'),
                onChanged: (value) => _location = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Chủ trì'),
                onChanged: (value) => _chairperson = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ghi chú'),
                onChanged: (value) => _notes = value,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Trạng thái nhiệm vụ'),
                value: _status,
                onChanged: (newValue) {
                  setState(() {
                    _status = newValue!;
                  });
                },
                items: _statuses
                    .map((status) =>
                        DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Người phê duyệt'),
                onChanged: (value) => _approvalPerson = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'date': _date,
                      'content': _content,
                      'time': _time,
                      'location': _location,
                      'chairperson': _chairperson,
                      'notes': _notes,
                      'status': _status,
                      'approvalPerson': _approvalPerson,
                    });
                  }
                },
                child: const Text('Lưu nhiệm vụ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
