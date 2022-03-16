import 'package:flutter/cupertino.dart';
import 'package:presentation/screen/home_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BlocState<S extends StatefulWidget, B extends HomeBlocInterface>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();
}
