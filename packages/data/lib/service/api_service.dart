import 'package:dio/dio.dart';

abstract class ApiService {
  factory ApiService(Dio dio) => ApiServiceImpl(dio);

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
}
