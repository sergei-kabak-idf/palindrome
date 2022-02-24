import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Palindrome palindrome = Palindrome();
  String text = '';
  bool answer = false;

  Widget _inputWidget() => Column(
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
            onSubmitted: (textTyping) {
              setState(() {
                text = textTyping;
              });
            },
            textAlign: TextAlign.center,
          ),
          Text(answer.toString()),
        ],
      );

  Widget _showButtonWidget() => FloatingActionButton(
        onPressed: () {
          setState(() {
            answer = palindrome(text, 0, text.length);
          });
        },
        child: const Icon(Icons.search),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _inputWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showButtonWidget(),
    );
  }
}
