import '../repository/domain_repository.dart';
import 'package:injectable/injectable.dart';

part 'use_case.dart';

@singleton
class PalindromeUseCaseImpl implements UseCase<String, Future<bool>> {
  PalindromeUseCaseImpl(this._repository);


  final PalindromeNetworkRepository _repository;


  @override
  Future<bool> call(String text) async {
    final response = await _repository
        .checkPalindrome(text)
        .then((value) => value.isPalindrome);
    return Future.value(response);
  }

  @override
  void dispose() {}
}
