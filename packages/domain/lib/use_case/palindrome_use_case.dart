import 'package:data/repository/data_repository.dart';

part 'use_case.dart';

class PalindromeUseCaseImpl implements UseCase<String, Future<bool>> {
  PalindromeUseCaseImpl(this._networkRepository);

  final PalindromeRepositoryImpl _networkRepository;

  @override
  Future<bool> call(String text, int first, int last) async {
    final response =
        await _networkRepository.checkPalindrome(text, first, last);
    return Future.value(response.isPalindrome);
  }

  @override
  void dispose() {}
}
