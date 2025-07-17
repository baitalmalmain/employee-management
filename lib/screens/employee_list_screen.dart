import 'package:flutter/material.dart';
import 'package:employee_management/widgets/employee_list_item.dart';
import 'package:employee_management/screens/add_employee_screen.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/models/employee.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.employeeList)),
      body: ValueListenableBuilder<Box<Employee>>(
        valueListenable: Hive.box<Employee>('employees').listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No employees found'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final employee = box.getAt(index) as Employee;
              return EmployeeListItem(employee: employee);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddEmployeeScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
