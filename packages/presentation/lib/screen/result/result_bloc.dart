import 'package:flutter/cupertino.dart';
import 'package:presentation/bloc/bloc_base.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/screen/result/result_data.dart';

abstract class ResultBlocInterface extends Bloc {
  factory ResultBlocInterface() => ResultBloc();

  void back();

  String arguments(BuildContext context);
}

@injectable
class ResultBloc extends BlocImpl implements ResultBlocInterface {
  @override
  void back() {
    appNavigator.pop();
  }

  @override
  String arguments(BuildContext context) {
    final resultArgument = ModalRoute.of(context)?.settings.arguments;

    if (resultArgument is ResultArguments) {
      return resultArgument.data.toString();
    } else {
      return '';
    }
  }
}
