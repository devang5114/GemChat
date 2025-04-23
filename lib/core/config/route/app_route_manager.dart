import 'package:flutter/material.dart';
import 'package:gemchat/core/config/route/app_routes.dart';

class AppRouteManager {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SizedBox(),
          settings: RouteSettings(name: AppRoutes.splash),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                body: Center(
                  child: Text(
                    "404\nScreen Not Found",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          settings: RouteSettings(name: AppRoutes.splash),
        );
    }
  }
}
