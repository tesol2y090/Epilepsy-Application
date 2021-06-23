// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:epilepsy/models/calendar/ChuckCard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChuckCardAdapter extends TypeAdapter<ChuckCard> {
  @override
  final int typeId = 0;

  @override
  ChuckCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChuckCard(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ChuckCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.epilepsyType)
      ..writeByte(2)
      ..write(obj.chuckTime)
      ..writeByte(3)
      ..write(obj.detail)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChuckCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
