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
        title: const Text('Thêm nhiệm vụ mới',style: TextStyle(color: Colors.white),),
        centerTitle: true,
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildCard(
                  child: ListTile(
                    title: Text(
                      _date == null ? 'Chọn ngày' : 'Ngày: $_date',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Nội dung nhiệm vụ',
                  onChanged: (value) => _content = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập nội dung nhiệm vụ';
                    }
                    return null;
                  },
                ),
                _buildTextFormField(
                  label: 'Thời gian',
                  onChanged: (value) => _time = value,
                ),
                _buildTextFormField(
                  label: 'Vị trí',
                  onChanged: (value) => _location = value,
                ),
                _buildTextFormField(
                  label: 'Chủ trì',
                  onChanged: (value) => _chairperson = value,
                ),
                _buildTextFormField(
                  label: 'Ghi chú',
                  onChanged: (value) => _notes = value,
                ),
                const SizedBox(height: 16),
                _buildCard(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Trạng thái nhiệm vụ',
                      border: InputBorder.none,
                    ),
                    value: _status,
                    onChanged: (newValue) {
                      setState(() {
                        _status = newValue!;
                      });
                    },
                    items: _statuses
                        .map((status) => DropdownMenuItem(
                            value: status, child: Text(status)))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Người phê duyệt',
                  onChanged: (value) => _approvalPerson = value,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
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
                  child: const Text(
                    'Lưu nhiệm vụ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.5),
      child: child,
    );
  }

  Widget _buildTextFormField({
    required String label,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return _buildCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}
