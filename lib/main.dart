import 'package:flutter/material.dart';
import 'package:palindrome/di/injector.dart';
import 'package:presentation/app.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}
