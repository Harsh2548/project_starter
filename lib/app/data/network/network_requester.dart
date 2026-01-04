import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../utils/helper/exception_handler.dart';
import '../../../utils/storage/storage_utils.dart';
import '../database/database_helper.dart';
import '../values/constants.dart';
import '../values/strings.dart';

class NetworkRequester {
  late Dio _dio;

  NetworkRequester() {
    prepareRequest();
  }

  void prepareRequest() async {
    String token = Strings.empty;
    if (Storage.isUserTokenExists()) {
      token = 'Bearer ${Storage.getUserToken()}';
    }
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Duration(milliseconds: Timeouts.CONNECT_TIMEOUT),
      receiveTimeout: Duration(milliseconds: Timeouts.RECEIVE_TIMEOUT),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers:Storage.isUserTokenExists()? {
        'Accept': Headers.jsonContentType,
        'Authorization': token,
      }:{
        'Accept': Headers.jsonContentType,

      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      enabled: kDebugMode,
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler)async {
          if (response.statusCode == 401) {
            handelUnauthorizedUser();
          }
          handler.next(response);
        },
        onError: (DioException error, handler) async{
          try {
            await DatabaseHelper().insertError({
              'api': error.requestOptions.path,
              'request': error.requestOptions.data.toString(),
              'response': error.response?.data.toString() ?? '',
              'headers': error.requestOptions.headers.toString(),
              'error': error.message,
              'statusCode': error.response?.statusCode ?? 0,
              'timestamp': DateTime.now().toIso8601String(),
            });
          }  catch (e) {
            // TODO:
          }
          if (error.response?.statusCode == 401) {
            await handelUnauthorizedUser();
          }

          handler.next(error);
        },
      ),
    );
  }

  Future<void> handelUnauthorizedUser() async {
    Storage.erase();
    // Get.offAllNamed(Routes.AUTH_LOGIN);
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      final jsonResponse = json.decode(json.encode(response.data));
      if ((jsonResponse["success"] ?? jsonResponse["status"] ?? false)) {
        return jsonResponse;
      }else {
        var message = decodeMessage(jsonResponse);
        throw message;
      }
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      final jsonResponse = json.decode(json.encode(response.data));
      if ((jsonResponse["success"] ?? jsonResponse["status"] ?? false)) {
        return jsonResponse;
      }
      var message = decodeMessage(jsonResponse);
      throw message;
    } on Exception catch (error) {
      throw ExceptionHandler.handleError(error).message;
    }
  }

  decodeMessage(jsonResponse) {
    dynamic message = jsonResponse["message"];

    if (message is List && message.isNotEmpty) {
      message = message.join(", ");
    } else if (message is! String) {
      message = "An unknown error occurred";
    }
    return message;
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      final jsonResponse = json.decode(json.encode(response.data));
      if ((jsonResponse["success"] ?? jsonResponse["status"] ?? false)) {
        return jsonResponse;
      }
      var message = decodeMessage(jsonResponse);
      throw message;
    } on Exception catch (error) {
      throw ExceptionHandler.handleError(error).message;
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio.patch(path, queryParameters: query, data: data);
      final jsonResponse = json.decode(json.encode(response.data));
      if ((jsonResponse["success"] ?? jsonResponse["status"] ?? false)) {
        return jsonResponse;
      }
      var message = decodeMessage(jsonResponse);
      throw message;
    } on Exception catch (error) {
      throw ExceptionHandler.handleError(error).message;
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio.delete(path, queryParameters: query, data: data);
      final jsonResponse = json.decode(json.encode(response.data));
      if ((jsonResponse["success"] ?? jsonResponse["status"] ?? false)) {
        return jsonResponse;
      }
      var message = decodeMessage(jsonResponse);
      throw message;
    } on Exception catch (error) {
      throw ExceptionHandler.handleError(error).message;
    }
  }
}
