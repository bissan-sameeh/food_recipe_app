import 'package:dio/dio.dart';

import '../strings/failure.dart';
import 'failure.dart';

class ServerException implements Exception {}

class EmptyCacheException implements Exception {}
class CacheException implements Exception {}

void handleException(e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException();
    case DioExceptionType.sendTimeout:
      throw ServerException();
    case DioExceptionType.receiveTimeout:
      throw ServerException();
    case DioExceptionType.badCertificate:
      throw ServerException();
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException();
        case 401:
          throw ServerException();
        case 403:
          throw ServerException();
        case 404:
          throw ServerException();
        case 409:
          throw ServerException();
        case 422:
          throw ServerException();
        case 504:
          throw ServerException();
      }
      throw ServerException();
    case DioExceptionType.cancel:
      throw ServerException();
    case DioExceptionType.connectionError:
      throw ServerException();
    case DioExceptionType.unknown:
      throw ServerException();
  }
}
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure _:
        return EMPTY_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error!,try again";
    }
  }

