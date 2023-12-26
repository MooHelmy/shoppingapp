class UserModel {
  final String? url;
  final String email;
  final String username;
  final String passowrd;
  String? id;
  UserModel({
    required this.url,
    required this.email,
    required this.username,
    required this.passowrd,
    this.id,
  });
  factory UserModel.fromjson(data, iddoc) {
    return UserModel(
        id: iddoc,
        url: data['url'],
        email: data['email'],
        username: data['name'],
        passowrd: data['passowrd']);
  }
}
