// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:started_app/core/constants/hive_type_ids.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mobile_settings.g.dart';

// Register the adapter
@HiveType(typeId: HiveTypeIds.mobileSettingsTypeId)
@JsonSerializable()
class MobileSettings extends INetworkModel<MobileSettings> {
  @HiveField(0)
  String? AppUrl;

  @HiveField(1)
  String? ApiUrl;

  @HiveField(2)
  String? PtsApiUrl;

  @HiveField(3)
  String? LisansApiUrl;

  @HiveField(4)
  String? LisansKey;

  @HiveField(5)
  String? Company;

  @HiveField(6)
  String? bgcolor1;

  @HiveField(7)
  String? bgcolor2;

  @HiveField(8)
  String? btncolor;

  @HiveField(9)
  String? btnborder;

  @HiveField(10)
  String? btntext;

  @HiveField(11)
  String? inpfill;

  @HiveField(12)
  String? inpborder;

  @HiveField(13)
  String? inptext;

  @HiveField(14)
  String? inpplace;

  @HiveField(15)
  String? txtremember;

  @HiveField(16)
  String? txtforgotpass;

  @HiveField(17)
  String? instaurl;

  @HiveField(18)
  String? faceurl;

  @HiveField(19)
  String? youtubeurl;

  @HiveField(20)
  String? logo;

  MobileSettings({
    this.AppUrl,
    this.ApiUrl,
    this.PtsApiUrl,
    this.LisansApiUrl,
    this.LisansKey,
    this.Company,
    this.bgcolor1,
    this.bgcolor2,
    this.btncolor,
    this.btnborder,
    this.btntext,
    this.inpfill,
    this.inpborder,
    this.inptext,
    this.inpplace,
    this.txtremember,
    this.txtforgotpass,
    this.instaurl,
    this.faceurl,
    this.youtubeurl,
    this.logo,
  });

  @override
  MobileSettings fromJson(Map<String, dynamic> json) =>
      MobileSettings.fromJson(json);

  factory MobileSettings.fromJson(Map<String, dynamic> json) =>
      _$MobileSettingsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MobileSettingsToJson(this);
}
