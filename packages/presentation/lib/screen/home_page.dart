import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/screen/home_bloc.dart';
import 'package:presentation/screen/home_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = HomeBloc(PalindromeUseCaseImpl());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: bloc.dataStream,
          builder:
              (BuildContext context, AsyncSnapshot<PalindromeData?> snapshot) =>
                  _inputWidget(snapshot),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _showButtonWidget(),
      );

  Widget _inputWidget(AsyncSnapshot<PalindromeData?> snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            onChanged: bloc.setString,
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
        onPressed: () => bloc.checkPalindrome(),
        child: const Icon(Icons.search),
      );
}
