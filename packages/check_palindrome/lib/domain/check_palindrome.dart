library check_palindrome;

import '../data/text_data.dart';

class Palindrome {
  DataPalindrome data = DataPalindrome();

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

  bool showAnswer() {
    int first = 0;
    int last = data.text.length - 1;

    return _checkPalindrome(data.text, first, last);
  }
}

