// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JwtModelAdapter extends TypeAdapter<JwtModel> {
  @override
  final int typeId = 1;

  @override
  JwtModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JwtModel(
      id: fields[0] as String,
      accessToken: fields[1] as String,
      userId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JwtModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JwtModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtModel _$JwtModelFromJson(Map<String, dynamic> json) => JwtModel(
      id: json['_id'] as String,
      accessToken: json['accessToken'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$JwtModelToJson(JwtModel instance) => <String, dynamic>{
      '_id': instance.id,
      'accessToken': instance.accessToken,
      'userId': instance.userId,
    };
