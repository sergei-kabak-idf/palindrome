import 'package:presentation/bloc/bloc_base.dart';
import 'package:injectable/injectable.dart';

abstract class ResultBlocInterface extends Bloc {
  factory ResultBlocInterface() => ResultBloc();

  void back();
}

@singleton
class ResultBloc extends BlocImpl implements ResultBlocInterface {

  @override
  void back() {
    appNavigator.pop();
  }
}
