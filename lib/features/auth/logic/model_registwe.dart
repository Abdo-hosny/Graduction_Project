class RequestSignUpModel {
  RequestSignUpModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,});

  RequestSignUpModel.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}