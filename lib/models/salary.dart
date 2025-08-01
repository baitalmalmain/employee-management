import 'package:hive/hive.dart';

part 'salary.g.dart';

@HiveType(typeId: 1)
class Salary {
  @HiveField(0)
  final String employeeId;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  Salary({
    required this.employeeId,
    required this.amount,
    required this.date,
  });
}


