import 'package:data/service/retrofit_api_service.dart';
import 'package:domain/model/palindrome_response.dart';
import 'package:domain/repository/domain_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PalindromeNetworkRepository)
class PalindromeRepositoryImpl implements PalindromeNetworkRepository {

  PalindromeRepositoryImpl(this._retrofitApiService);

  final RetrofitApiService _retrofitApiService;

  @override
  Future<PalindromeResponse> checkPalindrome(String text) async {
    final response = await _retrofitApiService.checkPalindrome(text);
    return response;
  }
}
