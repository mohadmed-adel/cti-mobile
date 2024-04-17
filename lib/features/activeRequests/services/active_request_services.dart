import 'dart:io';

import 'package:cti/main.dart';

import '../../../core/base-models/server_error_model.dart';
import '../../../core/network/api_strings.dart';
import '../models/comment_model.dart';
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

  static Future<RequestedServiceModel?> requestNewService(
      RequestedServiceModel requestedService) async {
    try {
      final response = await dioHelper?.post(ApiStrings.requestedServices,
          data: requestedService.toJson());
      return RequestedServiceModel.fromJson(response);
    } on ServerException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<CommentModel>> getCommentList(
      int requestedServicesId) async {
    try {
      final response =
          await dioHelper?.get("${ApiStrings.comments}/$requestedServicesId");
      return response
          .map<CommentModel>((item) => CommentModel.fromJson(item))
          .toList();
    } on ServerException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<CommentModel?> leaveComment(CommentModel commentModel) async {
    try {
      final response = await dioHelper?.post(
          "${ApiStrings.comments}/${commentModel.requestedServices}",
          data: commentModel.toJson());
      return CommentModel.fromJson(response);
    } on ServerException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> addAttachment(int id, File attachment) async {
    try {
      final response = await dioHelper?.uplaodImage("services/$id/attachment/",
          imageFile: attachment);
      return response['attachment'];
    } on ServerException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
