// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_card_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoCardDAOAdapter extends TypeAdapter<MemoCardDAO> {
  @override
  final int typeId = 0;

  @override
  MemoCardDAO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoCardDAO(
      fields[0] as String,
      fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MemoCardDAO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nodeHash)
      ..writeByte(1)
      ..write(obj.due);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoCardDAOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
