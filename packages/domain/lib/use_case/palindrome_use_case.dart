import 'package:domain/use_case/use_case.dart';

class PalindromeUseCaseImpl implements UseCase {
  bool _checkPalindrome(String text, int first, int last) {
    if (text.isEmpty | text.contains(RegExp(r'[0-9,^\s*]'))) {
      return false;
    } else if (first == last) {
      return true;
    } else if (text[first] != text[last]) {
      return false;
    } else if (first < last + 1) {
      return _checkPalindrome(text, first + 1, last - 1);
    }
    return true;
  }

  @override
  bool call(text, first, last) {
    return _checkPalindrome(text, first, last - 1);
  }
}
