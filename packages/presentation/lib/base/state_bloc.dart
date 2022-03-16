import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'base_bloc.dart';

abstract class BlocState<S extends StatefulWidget, B extends Bloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();
}
