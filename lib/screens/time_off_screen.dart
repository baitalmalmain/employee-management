import 'package:flutter/material.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/models/time_off.dart';
import 'package:employee_management/models/employee.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeOffScreen extends StatefulWidget {
  const TimeOffScreen({Key? key}) : super(key: key);

  @override
  State<TimeOffScreen> createState() => _TimeOffScreenState();
}

class _TimeOffScreenState extends State<TimeOffScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedEmployeeId;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1));
  final _reasonController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          if (_startDate.isAfter(_endDate)) {
            _endDate = _startDate.add(const Duration(days: 1));
          }
        } else {
          _endDate = picked;
          if (_endDate.isBefore(_startDate)) {
            _startDate = _endDate.subtract(const Duration(days: 1));
          }
        }
      });
    }
  }

  void _addTimeOffRecord() {
    if (_formKey.currentState!.validate() && _selectedEmployeeId != null) {
      final timeOff = TimeOff(
        employeeId: _selectedEmployeeId!,
        startDate: _startDate,
        endDate: _endDate,
        reason: _reasonController.text.trim(),
      );
      final box = Hive.box<TimeOff>('timeOffs');
      box.add(timeOff);
      _reasonController.clear();
      setState(() {
        _selectedEmployeeId = null;
        _startDate = DateTime.now();
        _endDate = DateTime.now().add(const Duration(days: 1));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Time off record added successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.timeOffTracking)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ValueListenableBuilder<Box<Employee>>(
                    valueListenable: Hive.box<Employee>('employees').listenable(),
                    builder: (context, box, _) {
                      final employees = box.values.toList();
                      return DropdownButtonFormField<String>(
                        value: _selectedEmployeeId,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.selectEmployee,
                          border: const OutlineInputBorder(),
                        ),
                        items: employees.map((employee) {
                          return DropdownMenuItem<String>(
                            value: employee.id,
                            child: Text(employee.name!),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedEmployeeId = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an employee';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.startDate),
                    subtitle: Text('${_startDate.day}/${_startDate.month}/${_startDate.year}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context, true),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.endDate),
                    subtitle: Text('${_endDate.day}/${_endDate.month}/${_endDate.year}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context, false),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.reason,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a reason';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _addTimeOffRecord,
                    child: Text(AppLocalizations.of(context)!.addRecord),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ValueListenableBuilder<Box<TimeOff>>(
                valueListenable: Hive.box<TimeOff>('timeOffs').listenable(),
                builder: (context, box, _) {
                  final timeOffs = box.values.toList();
                  if (timeOffs.isEmpty) {
                    return const Center(child: Text('No time off records found'));
                  }
                  return ListView.builder(
                    itemCount: timeOffs.length,
                    itemBuilder: (context, index) {
                      final timeOff = timeOffs[index];
                      return Card(
                        child: ListTile(
                          title: Text('Reason: ${timeOff.reason}'),
                          subtitle: Text('From: ${timeOff.startDate.day}/${timeOff.startDate.month}/${timeOff.startDate.year} To: ${timeOff.endDate.day}/${timeOff.endDate.month}/${timeOff.endDate.year}'),
                          trailing: Text('Employee ID: ${timeOff.employeeId}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

