import 'package:flutter/material.dart';
import 'package:employee_management/widgets/employee_list_item.dart';
import 'package:employee_management/screens/add_employee_screen.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/models/employee.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  String _searchQuery = '';
  String? _sortBy;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.employeeList),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                if (_sortBy == value) {
                  _sortAscending = !_sortAscending;
                } else {
                  _sortBy = value;
                  _sortAscending = true;
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'name',
                child: Text(AppLocalizations.of(context)!.sortByName),
              ),
              PopupMenuItem<String>(
                value: 'id',
                child: Text(AppLocalizations.of(context)!.sortById),
              ),
              PopupMenuItem<String>(
                value: 'salary',
                child: Text(AppLocalizations.of(context)!.sortBySalary),
              ),
              PopupMenuItem<String>(
                value: 'position',
                child: Text(AppLocalizations.of(context)!.sortByPosition),
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<Employee>>(
        valueListenable: Hive.box<Employee>('employees').listenable(),
        builder: (context, box, _) {
          List<Employee> employees = box.values.toList();

          // Filter employees based on search query
          if (_searchQuery.isNotEmpty) {
            employees = employees.where((employee) {
              return employee.name!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                     employee.id!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                     employee.email!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                     employee.position!.toLowerCase().contains(_searchQuery.toLowerCase());
            }).toList();
          }

          // Sort employees
          if (_sortBy != null) {
            employees.sort((a, b) {
              int comparison = 0;
              switch (_sortBy) {
                case 'name':
                  comparison = a.name!.compareTo(b.name!);
                  break;
                case 'id':
                  comparison = a.id!.compareTo(b.id!);
                  break;
                case 'salary':
                  comparison = a.salary!.compareTo(b.salary!);
                  break;
                case 'position':
                  comparison = a.position!.compareTo(b.position!);
                  break;
              }
              return _sortAscending ? comparison : -comparison;
            });
          }

          if (employees.isEmpty) {
            return const Center(child: Text('No employees found'));
          }
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
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

