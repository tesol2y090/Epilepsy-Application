// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeStamp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeStampAdapter extends TypeAdapter<TimeStamp> {
  @override
  final int typeId = 1;

  @override
  TimeStamp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeStamp(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeStamp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.afterBreak)
      ..writeByte(1)
      ..write(obj.afterLunch)
      ..writeByte(2)
      ..write(obj.afterEven)
      ..writeByte(3)
      ..write(obj.beforeBed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeStampAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
