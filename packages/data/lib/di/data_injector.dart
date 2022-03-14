import 'package:data/repository/palindrome_repository_implementation.dart';
import 'package:domain/repository/palindrome.dart';
import 'package:get_it/get_it.dart';

void initDataModule() {
  _initRepositoryModule();
}

void _initRepositoryModule() {
  GetIt.I.registerFactory<PalindromeRepository>(
    PalindromeRepositoryImpl.new,
  );
}
