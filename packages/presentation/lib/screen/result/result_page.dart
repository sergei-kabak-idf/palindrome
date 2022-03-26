import 'package:flutter/material.dart';
import 'package:presentation/screen/result/result_data.dart';
import 'package:presentation/screen/result/result_bloc.dart';
import '../../bloc/bloc_state.dart';
import '../app/app_page.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/ResultPage';

  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();

  static AppPage page({ResultArguments? arguments}) {
    return AppPage(
      key: const ValueKey(routeName),
      name: routeName,
      arguments: arguments,
      builder: (context) => const ResultPage(),
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
            final String result = bloc.arguments(context);
            return Center(
              child: OutlinedButton(
                onPressed: () => {
                  bloc.back(),
                },
                child: Text(result),
              ),
            );
          }),
    );
  }
}
