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

class CountriesData {
  /// Handel List Response
  late final List<CountryModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}

class CountryModel {
  late final int id;
  late final String code;
  late final String name;
  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? 0;
    name = json['name'] ?? 0;
  }
}
