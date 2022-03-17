import 'package:dio/dio.dart';
import 'package:data/assets/constants.dart';

Dio gioGet() {
  final baseOptional = BaseOptions(baseUrl: baseUrl);
  final client = Dio(baseOptional);
  client.interceptors.add(
    LogInterceptor(requestHeader: false),
  );
  return client;
}
