import 'package:cti/core/network/api_strings.dart';
import 'package:cti/features/services/services-list/models/cate_model.dart';
import 'package:cti/features/services/services-list/models/services_model.dart';

import '../../../../main.dart';

class ServicesListServeice {
  static Future<List<CategoryModel>> getCatsList() async {
    List<CategoryModel> cats = [];

    final response = await dioHelper?.get(ApiStrings.categories);
    response.toList().forEach((item) {
      cats.add(CategoryModel.fromJson(item));
    });

    return cats;
  }

  static Future<List<ServicesModel>> getCatServicesList(int cateId) async {
    List<ServicesModel> cats = [];

    final response = await dioHelper?.get("${ApiStrings.services}/$cateId");
    response.toList().forEach((item) {
      cats.add(ServicesModel.fromJson(item));
    });

    return cats;
  }
}
