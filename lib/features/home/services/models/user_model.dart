class UserModel {
  final String? error;
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.lastName,
      this.firstName,
      this.error});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}
