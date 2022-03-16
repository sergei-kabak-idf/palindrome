import 'package:data/repository/data_repository.dart';
import 'package:domain/use_case/use_case.dart';


class PalindromeUseCase implements UseCase {
  PalindromeUseCase(this._palindromeRepositoryImpl);

  final PalindromeRepositoryImpl _palindromeRepositoryImpl;

  @override
  bool call(String text, int first, int last) =>
      _palindromeRepositoryImpl.checkPalindrome(
        text,
        first,
        last,
      );

  @override
  void dispose() {}
}
