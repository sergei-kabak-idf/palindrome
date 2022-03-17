import 'dart:developer';
import 'package:data/mapper/palindrome_mapper.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/domain_repository.dart';

class PalindromeRepositoryImpl implements PalindromeNetworkRepository {
  PalindromeRepositoryImpl(this._mapperImpl, this._client);

  final PalindromeMapperImpl _mapperImpl;
  final Dio _client;

  @override
  Future<bool> checkPalindrome(String text, int first, int last) async {
    try {
      return networkCheckPalindrome(text, first, last);
    } catch (_) {
      return localCheckPalindrome(text, first, last);
    }
  }

  Future<bool> networkCheckPalindrome(String text, int first, int last) async {
    try {
      final response = await _client.get(text);
      return _mapperImpl(response.data as Map<String, dynamic>);
    } catch (_) {}
    return false;
  }

  Future<bool> localCheckPalindrome(String text, int first, int last) {
    if (text.isEmpty | text.contains(RegExp(r'[0-9,^\s*]'))) {
      return Future.value(false);
    } else if (first == last - 1) {
      return Future.value(true);
    } else if (text[first] != text[last - 1]) {
      return Future.value(false);
    } else if (first < last - 1) {
      return localCheckPalindrome(text, first + 1, last - 1);
    }
    return Future.value(true);
  }
}
