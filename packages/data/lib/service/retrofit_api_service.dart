import 'package:dio/dio.dart';
import 'package:domain/model/api_palindrome_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'retrofit_api_service.g.dart';

@injectable
@RestApi()
abstract class RetrofitApiService {
  @factoryMethod
  factory RetrofitApiService( Dio dio) = _RetrofitApiService;

  @GET('/ispalindrome/{text}')
  Future<ApiPalindromeResponse> checkPalindrome(@Path("text") String text);
}