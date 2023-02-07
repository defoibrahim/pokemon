// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart' as dio;
import 'package:pokemony/core/error/exceptions.dart';

dio.Response<dynamic> responseHandler(
  dio.Response<dynamic> response,
) {
  
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      return response;
    case 401:
      throw ServerException(message: 'Autherization problem, Please login agian');
    case 403:
      throw ServerException(
        message: 'Error occurred please check internet and retry.',
      );
    case 404:
      throw ServerException(message: 'Url not found');
    case 500:
      throw ServerException(message: "Server Error please retry later");
    default:
      throw ServerException(message: 'Something Went wrong, try again');
  }
}
