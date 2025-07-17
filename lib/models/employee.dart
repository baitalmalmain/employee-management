import 'package:hive/hive.dart';

part 'employee.g.dart';

@HiveType(typeId: 0)
class Employee {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? photoPath;

  @HiveField(4)
  final String? position;

  @HiveField(5)
  final String? phoneNumber;

  @HiveField(6)
  final String? address;

  @HiveField(7)
  final double? salary;

  Employee({
    this.id,
    this.name,
    this.email,
    this.photoPath,
    this.position,
    this.phoneNumber,
    this.address,
    this.salary,
  });
}
