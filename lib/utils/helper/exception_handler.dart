import 'package:dio/dio.dart';
import '../../app/data/values/strings.dart';
import 'custom_network_exception.dart';
import 'custom_snackbar.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioException) {
      String message = decodeApiMessage(error);
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioExceptionType.connectionTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioExceptionType.badResponse:
          return APIException(message: message);
        default:
          return APIException(message: message);
      }
    } else if (error is CustomNetworkException) {
      var message  = decodeMessageCustomNetworkException(error);
      return APIException(message: message);
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }

  static String decodeMessageCustomNetworkException(CustomNetworkException error) {
    var messageData = error.data['message'];
    String message;
    if (messageData is List) {
      message = messageData.join(", "); // Convert list to string
    } else if (messageData is String) {
      message = messageData;
    } else {
      message = ErrorMessages.networkGeneral;
    }
    return message;
  }

  static String decodeApiMessage(DioException error) {
    var messageData = error.response?.data["message"];
    String message;
    if (messageData is List) {
      message = messageData.join(", "); // Convert list to string
    } else if (messageData is String) {
      message = messageData;
    } else {
      message = ErrorMessages.networkGeneral;
    }
    return message;
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    CustomSnackBar.showInfo(error?.message ?? ErrorMessages.networkGeneral);
  }
}
