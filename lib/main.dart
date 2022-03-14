import 'package:flutter/material.dart';
import 'package:palindrome/di/injector.dart';
import 'package:presentation/app.dart';

void main() {
  initInjector();
  runApp(const MyApp());
}
