import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

typedef PageBuilder = Widget Function();

class PageRoutes {
  static pushAndRemoveUntil(PageBuilder page) async =>
      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (BuildContext context) => page()),
        (Route<dynamic> route) => false,
      );

  static pushReplacement(PageBuilder page) async => Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (BuildContext context) => page()),
      );

  static push(PageBuilder page) async => Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (BuildContext context) => page()),
      );

  static pop([dynamic val]) async =>
      Navigator.of(navigatorKey.currentContext!).pop(val);
}
