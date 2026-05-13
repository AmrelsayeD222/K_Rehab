// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProtocolDetailsModelAdapter extends TypeAdapter<ProtocolDetailsModel> {
  @override
  final int typeId = 0;

  @override
  ProtocolDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProtocolDetailsModel(
      phases: (fields[0] as List).cast<ProtocolPhaseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProtocolDetailsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.phases);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProtocolDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProtocolPhaseModelAdapter extends TypeAdapter<ProtocolPhaseModel> {
  @override
  final int typeId = 1;

  @override
  ProtocolPhaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProtocolPhaseModel(
      phaseName: fields[0] as String,
      phaseTitle: fields[1] as String,
      rehabGoals: (fields[2] as List).cast<String>(),
      criteriaToProgress: (fields[3] as List).cast<String>(),
      impairments: (fields[4] as List).cast<String>(),
      interventions: (fields[5] as List).cast<ProtocolInterventionModel>(),
      goals: (fields[6] as List).cast<String>(),
      rationale: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProtocolPhaseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.phaseName)
      ..writeByte(1)
      ..write(obj.phaseTitle)
      ..writeByte(2)
      ..write(obj.rehabGoals)
      ..writeByte(3)
      ..write(obj.criteriaToProgress)
      ..writeByte(4)
      ..write(obj.impairments)
      ..writeByte(5)
      ..write(obj.interventions)
      ..writeByte(6)
      ..write(obj.goals)
      ..writeByte(7)
      ..write(obj.rationale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProtocolPhaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProtocolInterventionModelAdapter
    extends TypeAdapter<ProtocolInterventionModel> {
  @override
  final int typeId = 2;

  @override
  ProtocolInterventionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProtocolInterventionModel(
      name: fields[0] as String,
      items: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProtocolInterventionModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProtocolInterventionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
