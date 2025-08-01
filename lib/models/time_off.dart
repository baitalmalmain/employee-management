import 'package:hive/hive.dart';

part 'time_off.g.dart';

@HiveType(typeId: 2)
class TimeOff {
  @HiveField(0)
  final String employeeId;

  @HiveField(1)
  final DateTime startDate;

  @HiveField(2)
  final DateTime endDate;

  @HiveField(3)
  final String reason;

  @HiveField(4)
  final bool approved;

  TimeOff({
    required this.employeeId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.approved = false,
  });
}

