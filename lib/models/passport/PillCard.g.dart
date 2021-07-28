// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PillCard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PillCardAdapter extends TypeAdapter<PillCard> {
  @override
  final int typeId = 2;

  @override
  PillCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PillCard(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as TimeStamp,
    );
  }

  @override
  void write(BinaryWriter writer, PillCard obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.no)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.freqSideEffect)
      ..writeByte(4)
      ..write(obj.dangerSideEffect)
      ..writeByte(5)
      ..write(obj.allergy)
      ..writeByte(6)
      ..write(obj.img)
      ..writeByte(7)
      ..write(obj.timeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PillCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
