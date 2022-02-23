import 'package:domain/use_case/use_case.dart';

class Palindrome implements UseCase {
  String text = '';
  bool answer = false;
  int first = 0;

  int get last => text.length - 1;

  bool _checkPalindrome(String text, int first, int last) {
    if (text.isEmpty | text.contains(RegExp(r'[0-9]'))) {
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
  bool call() {
    return _checkPalindrome(text, first, last);
  }
}
