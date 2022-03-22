import 'package:data/repository/data_repository.dart';

part 'use_case.dart';

class PalindromeUseCaseImpl implements UseCase<String, Future<bool>> {
  PalindromeUseCaseImpl(this._repository);

  final PalindromeRepositoryImpl _repository;

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
