import 'package:flutter/material.dart';
import 'package:employee_management/models/employee.dart';
import 'dart:io';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;

  const EmployeeListItem({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: employee.photoPath != null
            ? FileImage(File(employee.photoPath!))
            : null,
        child: employee.photoPath == null ? const Icon(Icons.person) : null,
      ),
      title: Text(employee.name ?? 'No Name'),
      subtitle: Text(employee.position ?? 'No Position'),
      trailing: Text(employee.salary?.toStringAsFixed(2) ?? '0.00'),
      onTap: () {
        // Navigate to employee detail screen
      },
    );
  }
}
