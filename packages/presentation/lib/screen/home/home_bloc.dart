import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/bloc/bloc_base.dart';
import '../result/result_page.dart';
import 'home_data.dart';

@singleton
abstract class HomeBloc extends Bloc {
  @factoryMethod
  factory HomeBloc(
    PalindromeUseCaseImpl _palindromeUseCase,
  ) =>
      _HomeBloc(_palindromeUseCase);

  void navigateToResult();

  void setString(String text);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final PalindromeUseCaseImpl _palindromeUseCase;
  final _screenData = PalindromeData.init();

  _HomeBloc(this._palindromeUseCase);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void navigateToResult() async {
    final bool result =
      await _palindromeUseCase(_screenData.inputPalindrome);
    appNavigator.push(
      ResultPage.page(result.toString()),
    );
  }

  @override
  void setString(String text) {
    _screenData.inputPalindrome = text;
  }

  void updateData() {
    super.handleData(data: _screenData.copy());
  }
}
