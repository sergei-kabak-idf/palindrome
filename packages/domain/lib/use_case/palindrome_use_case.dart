import 'package:domain/use_case/use_case.dart';

import '../repository/domain_repository.dart';

class PalindromeUseCase implements UseCase {
  PalindromeUseCase(this._palindromeRepository);

  final PalindromeRepository _palindromeRepository;

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
