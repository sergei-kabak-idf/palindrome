import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../navigator/app_navigator.dart';
import 'bloc_data.dart';

abstract class Bloc<D> {
  Stream<BlocData<D?>> get dataStream;

  void initState();

  void dispose();
}

class BlocImpl<D> implements Bloc<D> {
  @override
  Stream<BlocData<D?>> get dataStream => _controllerStream.stream;

  final _blocData = BlocData.init();

  final _controllerStream = StreamController<BlocData<D?>>();

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();

  @protected
  void handleData({
    bool? isValid,
    D? data,
  }) {
    if (!_controllerStream.isClosed) {
      _blocData.updateParams(data: data);
      _controllerStream.add(_blocData.copy<D>());
    }
  }

  @override
  void dispose() {
    _controllerStream.close();
  }

  @override
  void initState() {}
}
