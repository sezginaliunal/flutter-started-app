class RegisterRequest {
  String? email;
  String? password;
  String? name;
  String? lastname;

  RegisterRequest({this.email, this.password, this.name, this.lastname});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['lastname'] = lastname;
    return data;
  }
}
