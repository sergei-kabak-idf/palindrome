import 'package:injectable/injectable.dart';

part 'mapper.dart';

@singleton
class PalindromeMapper implements Mapper<Map<String, dynamic>, String>{
  @override
  String call(Map<String, dynamic> json) {
    return json['isPalindrome'].toString();
  }
}