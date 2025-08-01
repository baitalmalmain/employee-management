// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_off.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeOffAdapter extends TypeAdapter<TimeOff> {
  @override
  final int typeId = 2;

  @override
  TimeOff read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOff(
      employeeId: fields[0] as String,
      startDate: fields[1] as DateTime,
      endDate: fields[2] as DateTime,
      reason: fields[3] as String,
      approved: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimeOff obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.reason)
      ..writeByte(4)
      ..write(obj.approved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeOffAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
