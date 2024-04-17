import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/network/api_strings.dart';
import '../base-models/server_error_model.dart';
import '../local/storage_services.dart';
import 'network_interface.dart';

class DioHelper implements BaseNetwork {
  final Dio dio;

  DioHelper({required this.dio}) {
    dio.options.baseUrl = ApiStrings.apiUrl;

    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        logPrint: (value) => debugPrint(value.toString())));
  }
  @override
  Future get(String endPoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      StorageService storageService = await StorageService.init();
      String? token = storageService.getValue(key: StorageKeys.token);

      dio.options.headers = {
        if (token != null) "Authorization": "Bearer $token",
      };
      final response = await dio.get(ApiStrings.apiUrl + endPoint,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw e.response?.data;
      } else {
        handleDioErrors(e);
      }
    }
  }

  handleDioErrors(DioException err) {
    if (err.response?.statusCode == 401) {
      throw ServerException(message: err.response?.data['detail'], code: 401);
    }

    throw ServerException(
      message: err.response?.statusMessage ?? "",
      code: err.response!.statusCode!,
    );
  }

  @override
  Future post(String endPoint, {Map<String, dynamic>? data}) async {
    try {
      StorageService storageService = await StorageService.init();
      String? token = storageService.getValue(key: StorageKeys.token);

      dio.options.headers = {
        if (token != null) "Authorization": "Bearer $token",
      };
      final response = await dio.post(endPoint, data: data);

      return response.data;
    } on DioException catch (e) {
      handleDioErrors(e);
    }
  }

  @override
  Future uplaodImage(String endPoint, {required File imageFile}) async {
    try {
      StorageService storageService = await StorageService.init();
      String? token = storageService.getValue(key: StorageKeys.token);

      dio.options.headers = {
        if (token != null) "Authorization": "Bearer $token",
      };
      FormData data = FormData();
      data.files.add(MapEntry("attachment", convertToMultiPart(imageFile)));
      final response = await dio.post(endPoint, data: data);

      return response.data;
    } on DioException catch (e) {
      handleDioErrors(e);
    }
  }

  MultipartFile convertToMultiPart(File file) {
    return MultipartFile.fromFileSync(file.path,
        filename: file.path.split("/").last);
  }
}
