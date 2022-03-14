import 'package:flutter/material.dart';
import 'package:presentation/screen/home_bloc.dart';
import 'package:presentation/screen/home_data.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = GetIt.I.get<HomeBloc>();

  @override
  Widget build(BuildContext context) => StreamPlatformStackContent(
        context: context,
        dataStream: bloc.dataStream,
        setText: bloc.setString,
        checkPalindrome: bloc.checkPalindrome,
      );
}

class StreamPlatformStackContent extends StatelessWidget {
  final Stream<PalindromeData> dataStream;
  final Function(String) setText;
  final Function checkPalindrome;

  const StreamPlatformStackContent({
    Key? key,
    required BuildContext context,
    required this.dataStream,
    required this.setText,
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
        onPressed: () => checkPalindrome(),
        child: const Icon(Icons.search),
      );

  Widget _inputWidget(AsyncSnapshot<PalindromeData?> snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            onChanged: setText,
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
