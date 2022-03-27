import 'package:presentation/navigator/settings_page.dart';

import '../home/home_page.dart';

/// Список всех экранов
class AppData {
  List<SettingsPage> pages;

  AppData(this.pages);

  factory AppData.init() {
    /// Инициализация первого экрана
    final pages = List<SettingsPage>.from([HomePage.page()]);
    return AppData(pages);
  }
}
