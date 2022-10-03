// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ourUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OurUserDetailOriginal extends TypeAdapter<OurUser> {
  @override
  final int typeId = 123;

  @override
  OurUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OurUser(
      email: fields[2] as String?,
      name: fields[3] as String?,
      uid: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OurUser obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OurUserDetailOriginal &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
