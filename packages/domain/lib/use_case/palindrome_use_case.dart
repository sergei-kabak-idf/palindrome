import 'package:data/repository/data_repository.dart';
import 'package:domain/use_case/use_case.dart';

// @Singleton()
// @injectable
class PalindromeUseCase implements UseCase {
  PalindromeUseCase(this._palindromeRepository);

  final PalindromeRepositoryImpl _palindromeRepository;

  @override
  bool call(String text, int first, int last) =>
      _palindromeRepository.checkPalindrome(
        text,
        first,
        last,
      );

  @override
  void dispose() {}
}
