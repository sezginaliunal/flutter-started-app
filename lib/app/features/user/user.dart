import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> {
  Data? data;
  Support? support;

  User({
    this.data,
    this.support,
  });

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Data extends INetworkModel<Data> {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  @override
  Data fromJson(Map<String, dynamic> json) => Data.fromJson(json);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Support extends INetworkModel<Support> {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  @override
  Support fromJson(Map<String, dynamic> json) => Support.fromJson(json);

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SupportToJson(this);
}
