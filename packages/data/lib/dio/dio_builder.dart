import 'package:data/assets/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioBuilder {
  Dio dioBuilder() {
    final baseOptional = BaseOptions(baseUrl: baseUrl);
    final client = Dio(baseOptional);
    client.interceptors.add(
      LogInterceptor(requestHeader: false),
    );
    return client;
  }
}
