import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:started_app/core/config/constants/hive_type_ids.dart';

part 'jwt.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.jwtModelTypeId)
class JwtModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String accessToken;

  @HiveField(2)
  final String userId;

  JwtModel({
    required this.id,
    required this.accessToken,
    required this.userId,
  });

  factory JwtModel.fromJson(Map<String, dynamic> json) =>
      _$JwtModelFromJson(json);

  Map<String, dynamic> toJson() => _$JwtModelToJson(this);
}
