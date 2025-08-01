import 'package:flutter/material.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/models/salary.dart';
import 'package:employee_management/models/employee.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String? _selectedEmployeeId;
  DateTime _selectedDate = DateTime.now();

  void _addSalaryRecord() {
    if (_formKey.currentState!.validate() && _selectedEmployeeId != null) {
      final salary = Salary(
        employeeId: _selectedEmployeeId!,
        amount: double.parse(_amountController.text),
        date: _selectedDate,
      );
      final box = Hive.box<Salary>('salaries');
      box.add(salary);
      _amountController.clear();
      setState(() {
        _selectedEmployeeId = null;
        _selectedDate = DateTime.now();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Salary record added successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.salaryTracking)),
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
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.amount,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      } else if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.date),
                    subtitle: Text('${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() {
                          _selectedDate = date;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _addSalaryRecord,
                    child: Text(AppLocalizations.of(context)!.addRecord),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ValueListenableBuilder<Box<Salary>>(
                valueListenable: Hive.box<Salary>('salaries').listenable(),
                builder: (context, box, _) {
                  final salaries = box.values.toList();
                  if (salaries.isEmpty) {
                    return const Center(child: Text('No salary records found'));
                  }
                  return ListView.builder(
                    itemCount: salaries.length,
                    itemBuilder: (context, index) {
                      final salary = salaries[index];
                      return Card(
                        child: ListTile(
                          title: Text('Amount: \$${salary.amount}'),
                          subtitle: Text('Date: ${salary.date.day}/${salary.date.month}/${salary.date.year}'),
                          trailing: Text('Employee ID: ${salary.employeeId}'),
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

