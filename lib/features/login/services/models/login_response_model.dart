class LoginResponseModel {
  final String? refreshToken;
  final String? accessToken;
  final int code;
  final String? error;

  LoginResponseModel(
      {this.refreshToken, this.accessToken, required this.code, this.error});

  factory LoginResponseModel.fromJson(Map json) {
    return LoginResponseModel(
      accessToken: json["access-token"],
      refreshToken: json['refresh-token'],
      error: json['error'],
      code: json['code'],
    );
  }
}
