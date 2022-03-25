import 'package:flutter/material.dart';
import 'package:presentation/screen/result/result_bloc.dart';
import '../../bloc/bloc_state.dart';
import '../../navigator/settings_arguments.dart';
import '../app/app_page.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/ResultPage';

  const ResultPage({Key? key, required this.result}) : super(key: key);

  final String? result;

  @override
  State<ResultPage> createState() => _ResultPageState();

  static AppPage page(String? text, {SettingsArguments? arguments}) {
    return AppPage(
      key: const ValueKey(routeName),
      name: routeName,
      arguments: arguments,
      builder: (context) => ResultPage(result: text),
    );
  }
}

class _ResultPageState extends BlocState<ResultPage, ResultBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            return Center(
              child: OutlinedButton(
                onPressed: () => {
                  bloc.back(),
                },
                child: Text(widget.result ?? 'null'),
              ),
            );
          }),
    );
  }
}
