import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  User({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);

  User copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<Data>? data,
    Support? support,
  }) {
    return User(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }
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

  Data copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return Data(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }
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

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }
}
