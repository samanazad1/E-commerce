class UserModel {
  String? name;
  String? email;
  UserModel();
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
}
