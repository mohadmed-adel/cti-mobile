import 'dart:developer';

import 'package:cti/features/home/services/models/user_model.dart';

import '../../../core/base-models/server_error_model.dart';
import '../../../core/network/api_strings.dart';
import '../../../main.dart';

class HomeServices {
  static Future<UserModel> getUserInfo() async {
    try {
      final response = await dioHelper?.get(ApiStrings.user);

      return UserModel.fromJson(response);
    } on ServerException catch (e) {
      return UserModel(error: e.message.toString());
    } catch (e) {
      log("e$e");
      return UserModel(error: e.toString());
    }
  }
}
