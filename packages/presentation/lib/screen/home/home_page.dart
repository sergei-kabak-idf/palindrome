import 'package:flutter/material.dart';
import 'package:presentation/bloc/bloc_data.dart';
import 'package:presentation/navigator/settings_arguments.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import '../../bloc/bloc_state.dart';
import '../app/app_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  static AppPage page({SettingsArguments? arguments}) => AppPage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const HomePage(),
      );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  void _validatePalindrome() {
    bloc.navigateToResult();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: bloc.dataStream,
          initialData: BlocData.init(),
          builder: (context, snapshot) {
            return _inputWidget(bloc.setString);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _validatePalindrome(),
          child: const Icon(Icons.search),
        ),
      );

  Widget _inputWidget(void Function(String text) setString) => Center(
        child: TextFormField(
          onChanged: setString,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            hintText: "Typing palindrome",
          ),
          textAlign: TextAlign.center,
        ),
      );
}
