class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? countryCode;
  String? role;
  String? profilePhotoUrl;

  User({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.role,
    this.profilePhotoUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    role = json['role'];
    profilePhotoUrl = json['profilePhotoUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['countryCode'] = countryCode;
    data['role'] = role;
    data['profilePhotoUrl'] = profilePhotoUrl;
    return data;
  }
}
