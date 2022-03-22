import 'package:domain/model/palindrome_response.dart';

abstract class PalindromeNetworkRepository {
  Future<PalindromeResponse> checkPalindrome(String text);
}
