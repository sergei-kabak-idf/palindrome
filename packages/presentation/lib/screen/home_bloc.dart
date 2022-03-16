import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/screen/home_data.dart';
import 'package:injectable/injectable.dart';

// @singleton
abstract class HomeBlocInterface extends Bloc {
  @factoryMethod
  factory HomeBlocInterface(
      PalindromeUseCaseImpl _palindromeUseCase,
  ) =>
      HomeBloc(_palindromeUseCase);

  void checkPalindrome();

  void setString(String text);
}


class HomeBloc extends BlocImpl implements HomeBlocInterface {
  final PalindromeUseCaseImpl _palindromeUseCase;
  final _screenData = PalindromeData.init();

  HomeBloc(this._palindromeUseCase);

  @override
  void checkPalindrome() {
    final String text = _screenData.inputPalindrome;
    final bool isPalindrome;
    isPalindrome = _palindromeUseCase(
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
