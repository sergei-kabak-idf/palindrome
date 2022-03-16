import 'package:flutter/material.dart';
import 'package:presentation/screen/home_bloc.dart';
import 'package:presentation/screen/home_data.dart';

import '../base/state_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      context: context,
      dataStream: bloc.dataStream,
      setTextPalindrome: bloc.setTextPalindrome,
      checkPalindrome: bloc.checkPalindrome,
    );
  }
}

class StreamPlatformStackContent extends StatelessWidget {
  final Stream<PalindromeData> dataStream;
  final void Function(String) setTextPalindrome;
  final Function checkPalindrome;

  const StreamPlatformStackContent({
    Key? key,
    required BuildContext context,
    required this.dataStream,
    required this.setTextPalindrome,
    required this.checkPalindrome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: dataStream,
          builder:
              (BuildContext context, AsyncSnapshot<PalindromeData?> snapshot) =>
                  _inputWidget(snapshot),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _showButtonWidget(),
      );

  Widget _showButtonWidget() => FloatingActionButton(
        onPressed: () => checkPalindrome,
        child: const Icon(Icons.search),
      );

  Widget _inputWidget(AsyncSnapshot<PalindromeData?> snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            onChanged: setTextPalindrome,
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
          Text(snapshot.data?.isPalindrome.toString() ?? 'null'),
        ],
      );
}
