// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MobileSettingsAdapter extends TypeAdapter<MobileSettings> {
  @override
  final int typeId = 1;

  @override
  MobileSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MobileSettings(
      AppUrl: fields[0] as String?,
      ApiUrl: fields[1] as String?,
      PtsApiUrl: fields[2] as String?,
      LisansApiUrl: fields[3] as String?,
      LisansKey: fields[4] as String?,
      Company: fields[5] as String?,
      bgcolor1: fields[6] as String?,
      bgcolor2: fields[7] as String?,
      btncolor: fields[8] as String?,
      btnborder: fields[9] as String?,
      btntext: fields[10] as String?,
      inpfill: fields[11] as String?,
      inpborder: fields[12] as String?,
      inptext: fields[13] as String?,
      inpplace: fields[14] as String?,
      txtremember: fields[15] as String?,
      txtforgotpass: fields[16] as String?,
      instaurl: fields[17] as String?,
      faceurl: fields[18] as String?,
      youtubeurl: fields[19] as String?,
      logo: fields[20] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MobileSettings obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.AppUrl)
      ..writeByte(1)
      ..write(obj.ApiUrl)
      ..writeByte(2)
      ..write(obj.PtsApiUrl)
      ..writeByte(3)
      ..write(obj.LisansApiUrl)
      ..writeByte(4)
      ..write(obj.LisansKey)
      ..writeByte(5)
      ..write(obj.Company)
      ..writeByte(6)
      ..write(obj.bgcolor1)
      ..writeByte(7)
      ..write(obj.bgcolor2)
      ..writeByte(8)
      ..write(obj.btncolor)
      ..writeByte(9)
      ..write(obj.btnborder)
      ..writeByte(10)
      ..write(obj.btntext)
      ..writeByte(11)
      ..write(obj.inpfill)
      ..writeByte(12)
      ..write(obj.inpborder)
      ..writeByte(13)
      ..write(obj.inptext)
      ..writeByte(14)
      ..write(obj.inpplace)
      ..writeByte(15)
      ..write(obj.txtremember)
      ..writeByte(16)
      ..write(obj.txtforgotpass)
      ..writeByte(17)
      ..write(obj.instaurl)
      ..writeByte(18)
      ..write(obj.faceurl)
      ..writeByte(19)
      ..write(obj.youtubeurl)
      ..writeByte(20)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobileSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileSettings _$MobileSettingsFromJson(Map<String, dynamic> json) =>
    MobileSettings(
      AppUrl: json['AppUrl'] as String?,
      ApiUrl: json['ApiUrl'] as String?,
      PtsApiUrl: json['PtsApiUrl'] as String?,
      LisansApiUrl: json['LisansApiUrl'] as String?,
      LisansKey: json['LisansKey'] as String?,
      Company: json['Company'] as String?,
      bgcolor1: json['bgcolor1'] as String?,
      bgcolor2: json['bgcolor2'] as String?,
      btncolor: json['btncolor'] as String?,
      btnborder: json['btnborder'] as String?,
      btntext: json['btntext'] as String?,
      inpfill: json['inpfill'] as String?,
      inpborder: json['inpborder'] as String?,
      inptext: json['inptext'] as String?,
      inpplace: json['inpplace'] as String?,
      txtremember: json['txtremember'] as String?,
      txtforgotpass: json['txtforgotpass'] as String?,
      instaurl: json['instaurl'] as String?,
      faceurl: json['faceurl'] as String?,
      youtubeurl: json['youtubeurl'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$MobileSettingsToJson(MobileSettings instance) =>
    <String, dynamic>{
      'AppUrl': instance.AppUrl,
      'ApiUrl': instance.ApiUrl,
      'PtsApiUrl': instance.PtsApiUrl,
      'LisansApiUrl': instance.LisansApiUrl,
      'LisansKey': instance.LisansKey,
      'Company': instance.Company,
      'bgcolor1': instance.bgcolor1,
      'bgcolor2': instance.bgcolor2,
      'btncolor': instance.btncolor,
      'btnborder': instance.btnborder,
      'btntext': instance.btntext,
      'inpfill': instance.inpfill,
      'inpborder': instance.inpborder,
      'inptext': instance.inptext,
      'inpplace': instance.inpplace,
      'txtremember': instance.txtremember,
      'txtforgotpass': instance.txtforgotpass,
      'instaurl': instance.instaurl,
      'faceurl': instance.faceurl,
      'youtubeurl': instance.youtubeurl,
      'logo': instance.logo,
    };
