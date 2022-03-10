import 'package:domain/di/domain_injector.dart';
import 'package:presentation/di/presentation_injector.dart';

Future<void> initInjector() async {
  initPresentationModule();
  initDomainModule();
}
