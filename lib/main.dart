import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Palindrome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool result = false;

  void _showAnswer(String text) {
    int first = 0;
    int last = text.length - 1;

    setState(() {
      result = _checkPalindrome(text, first, last);
    });
  }

  bool _checkPalindrome(String text, int first, int last) {
    if (text.isEmpty) {
      return false;
    } else if (first == last) {
      return true;
    } else if (text[first] != text[last]) {
      return false;
    } else if (first < last + 1) {
      return _checkPalindrome(text, first + 1, last - 1);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
              onSubmitted: _showAnswer,
              textAlign: TextAlign.center,
            ),
            Text(result.toString()),
          ],
        ),
      ),
    );
  }
}
