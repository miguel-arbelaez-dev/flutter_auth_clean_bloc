class UserModel {
  final String token;

  UserModel({required this.token});

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }

  Map<String, dynamic> toMap() {
    return {'token': token};
  }
}
