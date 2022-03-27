import 'package:domain/model/palindrome_response.dart';

abstract class PalindromeDataRepository {
  Future<PalindromeResponse> checkPalindrome(String text);
}
