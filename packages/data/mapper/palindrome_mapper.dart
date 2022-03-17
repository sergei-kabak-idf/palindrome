part 'mapper.dart';

class PalindromeMapperImpl implements Mapper<bool, Map<String, dynamic>> {
  @override
  bool call(Map<String, dynamic> json) {
    final isPalindrome = json['isPalindrome'] as bool;
    return isPalindrome;
  }
}
