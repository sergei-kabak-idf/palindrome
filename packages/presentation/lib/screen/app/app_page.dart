import 'package:presentation/navigator/settings_arguments.dart';
import 'package:presentation/navigator/settings_page.dart';
import 'package:flutter/material.dart';
/// Настройки страницы
class AppPage extends SettingsPage {
  const AppPage({
    SettingsArguments? arguments,
    bool? showSlideAnim,
    required LocalKey key,
    required String name,
    required WidgetBuilder builder,
  }) : super(
          arguments,
          showSlideAnim,
          key: key,
          name: name,
          builder: builder,
        );
}
