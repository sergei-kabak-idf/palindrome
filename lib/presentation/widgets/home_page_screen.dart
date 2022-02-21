import 'package:flutter/material.dart';
import 'package:palindrom/domain/check_palindrome_usecase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Palindrome palindrome = Palindrome();

  Widget _inputWidget() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              hintText: "Typing palindrome",
            ),
            onSubmitted: (String textTyping) {
              setState(() {
                palindrome.data.text = textTyping;
              });
            },
            textAlign: TextAlign.center,
          ),
          Text(palindrome.data.answer.toString()),
        ],
      );

  Widget _showButtonWidget() =>
      FloatingActionButton(
        onPressed: () {
          setState(() {
            palindrome.data.answer = palindrome.showAnswer();
          });
        },
        child: const Icon(Icons.search),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _inputWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showButtonWidget(),
    );
  }
}
