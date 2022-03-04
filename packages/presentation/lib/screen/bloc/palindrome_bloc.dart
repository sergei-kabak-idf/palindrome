import 'dart:async';

import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/screen/bloc/palindrome_data.dart';
import 'package:presentation/screen/bloc/palindrome_event.dart';

abstract class Bloc {
  void dispose();
}

class PalindromeBloc extends Bloc {
  PalindromeUseCaseImpl palindrome = PalindromeUseCaseImpl();
  PalindromeData data = PalindromeData.init();
  final _controllerText = TextEditingController();
  final StreamController<PalindromeData> _controllerStream =
      StreamController<PalindromeData>();
  final StreamController<HomeBlocEvent> _eventController =
      StreamController<HomeBlocEvent>();

  TextEditingController get controllerText => _controllerText;

  Sink<PalindromeData> get _inputData => _controllerStream.sink;

  Sink<HomeBlocEvent> get inputCheckPalindrome => _eventController.sink;

  Stream<PalindromeData> get outputData => _controllerStream.stream;

  Stream<HomeBlocEvent> get _outputCheckPalindrome => _eventController.stream;

  PalindromeBloc() {
    _outputCheckPalindrome.listen(_listenEvent);
  }

  void _listenEvent(HomeBlocEvent event) {
    switch (event) {
      case HomeBlocEvent.CHECK_PALINDROME:
        data.isPalindrome = palindrome(
          _controllerText.text,
          0,
          _controllerText.text.length,
        );
        _inputData.add(data);
        break;
    }
  }

  @override
  void dispose() {
    _controllerStream.close();
    _eventController.close();
    _controllerText.clear();
  }
}
