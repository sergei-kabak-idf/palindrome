import 'package:flutter/widgets.dart';
import 'package:presentation/bloc/bloc_base.dart';
import '../../navigator/settings_page.dart';
import '../home/home_page.dart';
import 'app_data.dart';
import 'app_page.dart';


abstract class AppBlocInterface extends Bloc {
  factory AppBlocInterface() => AppBloc();

  void handleRemoveRouteSettings(RouteSettings value);
}

class AppBloc extends BlocImpl implements AppBlocInterface {
  final _appData = AppData.init();

  @override
  void initState() {
    super.initState();
    _initNavHandler();
    _updateData();
  }

  @override
  void handleRemoveRouteSettings(RouteSettings value) {
    _appData.pages.remove(value);
    _updateData();
  }

  void _updateData() {
    super.handleData(data: _appData);
  }

  void _initNavHandler() {
    appNavigator.init(
      push: _push,
      popOldAndPush: _popOldAndPush,
      popAllAndPush: _popAllAndPush,
      popAndPush: _popAndPush,
      pushPages: _pushPages,
      popAllAndPushPages: _popAllAndPushPages,
      pop: _pop,
      maybePop: _maybePop,
      popUntil: _popUntil,
      currentPage: _currentPage,
    );
  }

  void _push(SettingsPage page) {
    _appData.pages.add(page);
    _updateData();
  }

  void _popAllAndPush(SettingsPage page) {
    _appData.pages.clear();
    _push(page);
  }

  void _popOldAndPush(SettingsPage page) {
    final oldIndex = _appData.pages.indexWhere(
      (element) => element.name == page.name,
    );
    if (oldIndex != -1) {
      _appData.pages.removeAt(oldIndex);
    }
    _push(page);
  }

  void _popAndPush(SettingsPage page) {
    _appData.pages.removeLast();
    _push(page);
  }

  void _pushPages(List<SettingsPage> pages) {
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _popAllAndPushPages(List<SettingsPage> pages) {
    _appData.pages.clear();
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _pop() {
    _appData.pages.removeLast();
    _updateData();
  }

  void _maybePop() {
    if (_appData.pages.length > 1) {
      _pop();
    }
  }

  void _popUntil(SettingsPage page) {
    final start = _appData.pages
        .indexWhere((e) => e.name == page.name) + 1;
    final end = _appData.pages.length;
    _appData.pages.removeRange(start, end);
    _updateData();
  }

  AppPage _currentPage() {
    if (_appData.pages.isEmpty) {
      _appData.pages.add(HomePage.page());
    }
    return _appData.pages.last as AppPage;
  }
}
