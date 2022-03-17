import 'dart:math';
import 'package:domain/model/palindrome_response.dart';
import 'package:domain/repository/domain_repository.dart';

part 'local_check.dart';
part 'network_check.dart';

class PalindromeRepositoryImpl implements PalindromeNetworkRepository {
  @override
  Future<PalindromeResponse> checkPalindrome(
      String text, int first, int last) async {
    return Random().nextBool()
        ? localCheckPalindrome(text, first, last)
        : networkCheckPalindrome(text, first, last);
  }
}
