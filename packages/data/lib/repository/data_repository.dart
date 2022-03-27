import 'package:data/mapper/palindrome_mapper.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/domain_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PalindromeDataRepository)
class PalindromeRepositoryImpl implements PalindromeDataRepository {
  PalindromeRepositoryImpl(this._client, this._mapper);

  final Dio _client;
  final PalindromeMapper _mapper;

  @override
  Future<String> call(String text) async {
    try {
      final response = await _client.get(text);
      return _mapper(response.data);
    } catch (_) {}
    return 'null';
  }
}
