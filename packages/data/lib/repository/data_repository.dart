import 'package:dio/dio.dart';
import 'package:domain/repository/domain_repository.dart';

import '../mapper/mapper.dart';

class PalindromeRepositoryImpl implements PalindromeNetworkRepository {
  PalindromeRepositoryImpl( this._client);

  final Dio _client;

  @override
  Future<bool> checkPalindrome(String text, int first, int last) async {
    try {
      final response = await _client.get(text);
      return Mapper.call(response.data);
    } catch (_) {}
    return false;
  }
}
