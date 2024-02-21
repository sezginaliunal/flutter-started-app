class UserInfo {
  bool? success;
  Data? data;
  String? message;

  UserInfo({this.success, this.data, this.message});

  UserInfo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = this.data?.toJson();
    data['message'] = message;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? lastname;
  String? email;

  Data({this.sId, this.name, this.lastname, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    return data;
  }
}
