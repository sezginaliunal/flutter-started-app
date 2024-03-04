import 'package:started_app/app/data/models/base_model.dart';

class SampleModel extends BaseModel<SampleModel> {
  String? email;
  String? password;

  SampleModel({this.email, this.password});

  @override
  SampleModel fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class SampleModelResponse extends BaseModel<SampleModelResponse> {
  String? token;

  SampleModelResponse({this.token});

  @override
  SampleModelResponse fromJson(dynamic json) {
    token = json['token'];
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['token'] = token;
    return data;
  }
}
