part of 'data_repository.dart';

Future<PalindromeResponse> networkCheckPalindrome(
    String text, int first, int last) async {
  await Future.delayed(const Duration(seconds: 5));
  return Future.value(
    PalindromeResponse(
      Random().nextBool(),
    ),
  );
}
