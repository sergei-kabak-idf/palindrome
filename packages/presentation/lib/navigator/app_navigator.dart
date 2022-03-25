import 'package:presentation/navigator/settings_arguments.dart';
import 'package:presentation/navigator/settings_page.dart';
import '../screen/app/app_page.dart';
import 'package:injectable/injectable.dart';

/// Функции взаимодействие со страницами

abstract class AppNavigator {
  ///region init function

  void init({
    Function(SettingsPage page) push,
    Function<T>(SettingsPage page, T text) pushWithArguments,

    ///ABC -> ACB
    Function(SettingsPage page) popOldAndPush,

    ///ABC -> D
    Function(SettingsPage page) popAllAndPush,

    ///A -> ABCD
    Function(List<SettingsPage> pages) pushPages,

    ///ABC -> AB
    Function(SettingsPage page) popAndPush,

    ///CDN -> ABC
    Function(List<SettingsPage> pages) popAllAndPushPages,
    Function() pop,
    Function() maybePop,
    Function(SettingsPage page) popUntil,
    /**
     * Текущая страница
     */
    AppPage? Function() currentPage,
  });

  /// endregion

  ///region nav operators

  void push(SettingsPage page);

  void pushWithArgument<T>(SettingsPage page, T text);

  void popAllAndPush(SettingsPage page);

  void popOldAndPush(SettingsPage page);

  void pushPages(List<SettingsPage> pages);

  void popAndPush(SettingsPage page);

  void popAllAndPushPages(List<SettingsPage> pages);

  void pop();

  void maybePop();

  void popUntil(SettingsPage page);

  AppPage? currentPage();

  ///endregion
}

@Singleton(as: AppNavigator)
class AppNavigatorImpl implements AppNavigator {
  ///region functions

  Function(SettingsPage page)? _push;
  Function<T>(SettingsPage page, T text)? _pushWithArguments;
  Function(SettingsPage page)? _popOldAndPush;
  Function(SettingsPage page)? _popAllAndPush;
  Function(List<SettingsPage> pages)? _pushPages;
  Function(SettingsPage page)? _popAndPush;
  Function(List<SettingsPage> pages)? _popAllAndPushPages;
  Function()? _pop;
  Function()? _maybePop;
  Function(SettingsPage page)? _popUntil;
  AppPage? Function()? _currentPage;

  ///endregion
  @override
  void init({
    ///region init function

    Function(SettingsPage page)? push,
    Function<T>(SettingsPage page, T text)? pushWithArguments,
    Function(SettingsPage page)? popOldAndPush,
    Function(SettingsPage page)? popAllAndPush,
    Function(List<SettingsPage> pages)? pushPages,
    Function(SettingsPage page)? popAndPush,
    Function(List<SettingsPage> pages)? popAllAndPushPages,
    Function()? pop,
    Function()? maybePop,
    Function(SettingsPage page)? popUntil,
    AppPage? Function()? currentPage,

    ///endregion
  }) {
    ///region map function

    _push = push;
    _pushWithArguments = pushWithArguments;
    _popOldAndPush = popOldAndPush;
    _popAllAndPush = popAllAndPush;
    _pushPages = pushPages;
    _popAndPush = popAndPush;
    _popAllAndPushPages = popAllAndPushPages;
    _pop = pop;
    _maybePop = maybePop;
    _popUntil = popUntil;
    _currentPage = currentPage;

    ///endregion
  }
  ///region override function
  @override
  void push(SettingsPage page) => _push?.call(page);

  @override
  void pushWithArgument<T>(
    SettingsPage<SettingsArguments> page,
    T arg,
  ) =>
      _pushWithArguments?.call(page, arg);

  @override
  void popAllAndPush(SettingsPage page) => _popAllAndPush?.call(page);

  @override
  void pushPages(List<SettingsPage> pages) => _pushPages?.call(pages);

  @override
  void pop() => _pop?.call();

  @override
  void maybePop() => _maybePop?.call();

  @override
  void popUntil(SettingsPage page) => _popUntil?.call(page);

  @override
  void popAndPush(SettingsPage page) => _popAndPush?.call(page);

  @override
  void popAllAndPushPages(List<SettingsPage> pages) =>
      _popAllAndPushPages?.call(pages);

  @override
  void popOldAndPush(SettingsPage<SettingsArguments> page) {
    _popOldAndPush?.call(page);
  }

  @override
  AppPage currentPage() => _currentPage?.call() as AppPage;

  ///endregion
}
