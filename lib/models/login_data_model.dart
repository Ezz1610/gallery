
import 'dart:convert';

class LoginDataModel {
  static final sharedInstance = LoginDataModel._();

  LoginDataModel._();
  LoginDataModel({
      User? user, 
      String? token,}){
    _user = user;
    _token = token;
}

  LoginDataModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
LoginDataModel copyWith({  User? user,
  String? token,
}) => LoginDataModel(  user: user ?? _user,
  token: token ?? _token,
);
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// id : 305
/// name : "Rosetta Ruecker"
/// email : "mia.smitham@example.net"
/// email_verified_at : "2024-03-31T22:07:03.000000Z"
/// created_at : "2024-03-31T22:07:03.000000Z"
/// updated_at : "2024-03-31T22:07:03.000000Z"

class User {
  User({
      num? id, 
      String? name, 
      String? email, 
      String? emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? email,
  String? emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static LoginDataModel? fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return LoginDataModel.fromJson(json);
  }
}