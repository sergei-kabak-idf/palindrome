import 'package:domain/use_case/use_case.dart';

class PalindromeUseCaseImpl implements UseCase {

  @override
  bool call(String text, int first, int last ) {
    if (text.isEmpty | text.contains(RegExp(r'[0-9,^\s*]'))) {
      return false;
    } else if (first == last - 1) {
      return true;
    } else if (text[first] != text[last - 1]) {
      return false;
    } else if (first < last - 1 ) {
      return call(text, first + 1, last - 1);
    }
    return true;
  }
}
