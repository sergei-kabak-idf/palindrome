part of 'palindrome_mapper.dart';

abstract class Mapper<Output, Json> {
  Output call(Json json);
}

