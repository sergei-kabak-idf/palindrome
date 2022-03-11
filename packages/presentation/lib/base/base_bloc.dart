import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presentation/screen/home_data.dart';

abstract class Bloc {
  Stream<PalindromeData> get dataStream;

  void initState();

  void dispose();
}

class BlocImpl implements Bloc {
  @override
  Stream<PalindromeData> get dataStream => _controllerStream.stream;

  final _blocData = PalindromeData.init();

  final _controllerStream = StreamController<PalindromeData>();

  @protected
  void updateState(bool? isPalindrome, String? inputPalindrome) {
    if (!_controllerStream.isClosed) {
      _blocData(
        isPalindrome: isPalindrome,
        inputPalindrome: inputPalindrome,
      );
    }
    _controllerStream.add(_blocData);
  }

  @override
  void dispose() {
    _controllerStream.close();
  }

  @override
  void initState() {}
}
