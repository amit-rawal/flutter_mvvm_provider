import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/views/pages/coming_soon.dart';

import '../../views/pages/dashboard_page.dart';
import 'navigation_pages.dart';

enum AppNavigationMode { push, pushAndReplace, pushAndRemoveRest }

class AppNavigator extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  AppNavigator._private();
  static final _instance = AppNavigator._private();
  static AppNavigator get instance => _instance;

  static final List<Page> _pages = <Page>[];

  static void init() {
    try {
      _instance.navigatorKey = GlobalKey<NavigatorState>();
      if (_pages.isEmpty) {
        _pages.add(_instance._createPage(
            const RouteSettings(name: NavigationPages.kDashboard)));
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  late final GlobalKey<NavigatorState> navigatorKey;

  // @override
  // GlobalKey<NavigatorState> get key => navigatorKey;

  ///[currentRoute] returns null if there is no current route, or it is annonymous
  static String? get currentRoute =>
      _pages.isNotEmpty ? _pages.last.name : null;

  @override
  Future<bool> popRoute() async {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return await _confirmAppExit() ?? true;
  }

  Future<bool?> _confirmAppExit() async {
    if (navigatorKey.currentContext != null) {
      return showDialog<bool>(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context, true)),
                  TextButton(
                      child: const Text('Confirm'),
                      onPressed: () => Navigator.pop(context, false))
                ]);
          });
    } else {
      return true;
    }
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  void navigateTo(
      {required String name,
      dynamic arguments,
      final AppNavigationMode mode = AppNavigationMode.push}) {
    switch (mode) {
      case AppNavigationMode.push:
        _pages
            .add(_createPage(RouteSettings(name: name, arguments: arguments)));
        break;

      case AppNavigationMode.pushAndReplace:
        if (_pages.length > 1) {
          _pages.removeLast();
        }
        _pages
            .add(_createPage(RouteSettings(name: name, arguments: arguments)));
        break;

      case AppNavigationMode.pushAndRemoveRest:
        if (_pages.isNotEmpty) {
          _pages.clear();
        }
        _pages
            .add(_createPage(RouteSettings(name: name, arguments: arguments)));
        break;
    }

    notifyListeners();
  }

  void navigateBack() => popRoute();

  MaterialPage _createPage(RouteSettings routeSettings) {
    late final Widget child;

    switch (routeSettings.name) {
      case NavigationPages.kDashboard:
        child = DashboardPage();
        break;

      case NavigationPages.kComingSoonPage:
        if (routeSettings.arguments is String) {
          child = ComingSoonPage(pageTitle: routeSettings.arguments as String);
        } else {
          child = _errorRoute;
        }
        break;

      default:
        child = _errorRoute;
        break;
    }

    return MaterialPage(
        child: child,
        key: ValueKey(routeSettings.name),
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  static Widget get _errorRoute {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oops!'),
      ),
      body: const Center(
        child: Text('Something went wrong'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }
}
