import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home_data.dart';

abstract class HomeBloc extends Bloc {
  factory HomeBloc(
    PalindromeUseCaseImpl palindromeUseCaseImpl,
  ) =>
      _HomeBloc(palindromeUseCaseImpl);

  void checkPalindrome();

  void setString(String text);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final PalindromeUseCaseImpl _palindromeUseCaseImpl;
  final _screenData = PalindromeData.init();

  _HomeBloc(this._palindromeUseCaseImpl);

  @override
  void checkPalindrome() {
    final String text = _screenData.inputPalindrome;
    final bool isPalindrome;
    isPalindrome = _palindromeUseCaseImpl(
      text,
      0,
      text.length,
    );
    updateState(isPalindrome, text);
  }

  @override
  void setString(String text) {
    _screenData.inputPalindrome = text;
  }
}
