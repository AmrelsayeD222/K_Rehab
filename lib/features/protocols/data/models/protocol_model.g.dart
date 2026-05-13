// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProtocolModelAdapter extends TypeAdapter<ProtocolModel> {
  @override
  final int typeId = 6;

  @override
  ProtocolModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProtocolModel(
      id: fields[0] as String,
      title: fields[1] as String,
      subtitle: fields[2] as String,
      isClinicallyReviewed: fields[3] as bool,
      imagePath: fields[4] as String,
      duration: fields[5] as String,
      sessions: fields[6] as String,
      isFree: fields[7] as bool,
      isFeatured: fields[8] as bool,
      details: fields[9] as ProtocolDetailsModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProtocolModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.isClinicallyReviewed)
      ..writeByte(4)
      ..write(obj.imagePath)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.sessions)
      ..writeByte(7)
      ..write(obj.isFree)
      ..writeByte(8)
      ..write(obj.isFeatured)
      ..writeByte(9)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProtocolModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
