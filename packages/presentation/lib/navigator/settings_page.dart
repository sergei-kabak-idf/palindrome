import 'package:flutter/material.dart';
import 'package:presentation/navigator/settings_arguments.dart';

/// Настройки поведения страницы
///
abstract class SettingsPage<T extends SettingsArguments> extends Page {
  const SettingsPage(
    T? arguments,
    this.showSlideAnim, {
    required LocalKey key,
    required String name,
    required this.builder,
  }) : super(key: key, name: name, arguments: arguments);

  final WidgetBuilder builder;
  final bool? showSlideAnim;

  @override
  Route createRoute(BuildContext context) => _AppRoute(
      builder: builder, settings: this, showSlideAnim: showSlideAnim == true);

  @override
  String toString() => '$name';
}

class _AppRoute extends MaterialPageRoute {
  _AppRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.showSlideAnim = false,
  }) : super(builder: builder, settings: settings);

  final bool showSlideAnim;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (!showSlideAnim) {
      return RotationTransition(
        turns: animation,
        child: child,
      );
    }
    return Theme.of(context).pageTransitionsTheme.buildTransitions(
          this,
          context,
          animation,
          secondaryAnimation,
          child,
        );
  }
}
