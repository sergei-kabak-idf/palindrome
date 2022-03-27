import 'package:injectable/injectable.dart';
import '../repository/domain_repository.dart';

part 'use_case.dart';

@singleton
class PalindromeUseCaseImpl implements UseCase<String, Future<String>> {
  PalindromeUseCaseImpl(this._repository);

  final PalindromeDataRepository _repository;

  @override
  Future<String> call(String text) async {
    final response = await _repository.call(text);
    return Future.value(response);
  }

  @override
  void dispose() {}
}
