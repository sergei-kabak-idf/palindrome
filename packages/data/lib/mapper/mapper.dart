part of 'palindrome_mapper.dart';

abstract class Mapper<Input, Output> {
  Output call(Input json);
}
