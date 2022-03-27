part of 'palindrome_use_case.dart';

abstract class UseCase<Input, Output> {
  Output call(String text);

  void dispose();
}
