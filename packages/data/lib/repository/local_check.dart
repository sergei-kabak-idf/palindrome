part of 'data_repository.dart';

Future<PalindromeResponse> localCheckPalindrome(String text, int first, int last){
  if (text.isEmpty | text.contains(RegExp(r'[0-9,^\s*]'))) {
    return Future.value(PalindromeResponse(false));
  } else if (first == last - 1) {
    return Future.value(PalindromeResponse(true));
  } else if (text[first] != text[last - 1]) {
    return Future.value(PalindromeResponse(false));
  } else if (first < last - 1) {
    return localCheckPalindrome(text, first + 1, last - 1);
  }
  return Future.value(PalindromeResponse(true));
}