// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalaryAdapter extends TypeAdapter<Salary> {
  @override
  final int typeId = 1;

  @override
  Salary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salary(
      employeeId: fields[0] as String,
      amount: fields[1] as double,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Salary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
