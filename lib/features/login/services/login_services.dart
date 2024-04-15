import 'package:cti/core/base-models/server_error_model.dart';
import 'package:cti/features/login/services/models/login_response_model.dart';

import '../../../core/network/api_strings.dart';
import '../../../main.dart';

class LoginServeice {
  static Future<LoginResponseModel> login(
      {required String username, required String password}) async {
    try {
      final response = await dioHelper?.post(
        ApiStrings.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      return LoginResponseModel.fromJson(response);
    } on ServerException catch (e) {
      return LoginResponseModel(code: e.code, error: e.message.toString());
    } catch (e) {
      return LoginResponseModel(code: 500, error: e.toString());
    }
  }
}
