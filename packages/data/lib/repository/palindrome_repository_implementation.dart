import 'package:domain/repository/palindrome.dart';

class PalindromeRepositoryImpl implements PalindromeRepository {
  @override
  bool checkPalindrome(String text, int first, int last) {
    if (text.isEmpty | text.contains(RegExp(r'[0-9,^\s*]'))) {
      return false;
    } else if (first == last - 1) {
      return true;
    } else if (text[first] != text[last - 1]) {
      return false;
    } else if (first < last - 1) {
      return checkPalindrome(text, first + 1, last - 1);
    }
    return true;
  }
}
