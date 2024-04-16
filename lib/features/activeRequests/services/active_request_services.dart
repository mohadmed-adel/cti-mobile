import 'package:cti/main.dart';

import '../../../core/base-models/server_error_model.dart';
import '../../../core/network/api_strings.dart';
import '../models/requested_services_model.dart';

class ActiveRequestServices {
  static Future<List<RequestedServiceModel>> getActiveRequestList() async {
    try {
      final response = await dioHelper?.get(ApiStrings.requestedServices);
      return response
          .map<RequestedServiceModel>(
              (item) => RequestedServiceModel.fromJson(item))
          .toList();
    } on ServerException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
