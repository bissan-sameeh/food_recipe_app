import 'package:dio/dio.dart';
import 'package:food_recipe/core/api_helper/api_consumer.dart';
import 'package:food_recipe/core/api_helper/end_points.dart';
import 'package:food_recipe/core/error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPoints.baseUrl;

        // EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      error: true,
      responseBody: true,
      requestHeader: true
    ));
  }

  @override
  Future delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    // TODO: implement delete
    try {
      final response =
          await dio.delete(path, queryParameters: queryParameters,   data:isFormData ? FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleException(e);
  }

  }


  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    // TODO: implement get

    try {
      final response =
          await dio.get(path, queryParameters: queryParameters,  data: data);
      return response.data;
    } on DioException catch (e) {
      handleException(e);
    }
  }

  @override
  Future post(String path,
      {
        dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false
      }) async {
    try {
      final response = await dio.post(path, queryParameters: queryParameters,  data:isFormData ? FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleException(e);
    }
  }

  @override
  Future put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async {
    try {
      final response = await dio.put(path, queryParameters: queryParameters, data:isFormData ? FormData.fromMap(data): data);
      return response.data;
    } on DioException catch (e) {
      handleException(e);
    }  }
}
