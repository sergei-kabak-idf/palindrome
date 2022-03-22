import 'package:json_annotation/json_annotation.dart';
import 'package:domain/model/palindrome_response.dart';

part 'api_palindrome_response.g.dart';

@JsonSerializable()
class ApiPalindromeResponse implements PalindromeResponse{
  @override
  final bool? isPalindrome;

  ApiPalindromeResponse(this.isPalindrome);

  factory ApiPalindromeResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ApiPalindromeResponseFromJson(json);
}