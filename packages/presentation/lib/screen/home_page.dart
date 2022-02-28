import 'package:flutter/material.dart';
import 'package:presentation/screen/bloc/palindrome_bloc.dart';
import 'package:presentation/screen/bloc/palindrome_data.dart';
import 'package:provider/provider.dart';
import 'bloc/palindrome_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PalindromeBloc bloc = PalindromeBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bloc,
      child: Scaffold(
        body: StreamBuilder(
          stream: bloc.outputData,
          builder:
              (BuildContext context, AsyncSnapshot<PalindromeData?> snapshot) {
            return _inputWidget(snapshot);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _showButtonWidget(),
      ),
    );
  }

  Widget _inputWidget(AsyncSnapshot<PalindromeData?> snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            controller: bloc.controllerText,
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

  Widget _showButtonWidget() => FloatingActionButton(
        onPressed: () {
          bloc.inputCheckPalindrome.add(HomeBlocEvent.checkPalindrome);
        },
        child: const Icon(Icons.search),
      );
}
