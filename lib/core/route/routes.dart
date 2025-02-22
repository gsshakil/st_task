import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:st_task/core/route/route_not_found_widget.dart';
import 'package:st_task/features/health/presentation/screens/health_home_screen.dart';
import 'package:st_task/features/health/presentation/screens/health_report_screen.dart';
import 'package:st_task/features/initial/presentation/screens/getting_started_screen.dart';
import 'package:st_task/features/initial/presentation/screens/splash_screen.dart';

class RouteNames {
  static const String splashScreen = 'splashScreen';
  static const String gettingStartedScreen = 'gettingStartedScreen';
  static const String healthHomeScreen = 'healthHomeScreen';
  static const String reportScreen = 'reportScreen';
}

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.gettingStartedScreen:
        return CupertinoPageRoute(builder: (_) => const GettingStartedScreen());
      case RouteNames.healthHomeScreen:
        return CupertinoPageRoute(builder: (_) => const HealthHomeScreen());
      case RouteNames.reportScreen:
        return CupertinoPageRoute(builder: (_) => const HealthReportScreen());
      default:
        return CupertinoPageRoute(
          builder: (_) => RouteNotFoundWidget(title: settings.name ?? ''),
        );
    }
  }
}
