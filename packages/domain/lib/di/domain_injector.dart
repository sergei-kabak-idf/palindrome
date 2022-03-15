import 'package:domain/use_case/palindrome_use_case.dart';
import 'package:get_it/get_it.dart';

void initDomainModule() {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerLazySingleton<PalindromeUseCase>(
    () => PalindromeUseCase(
      GetIt.I.get(),
    ),
  );
}
