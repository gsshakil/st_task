import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:st_task/features/health/presentation/screens/health_home_screen.dart';
import 'package:st_task/features/health/presentation/screens/health_report_screen.dart';
import 'package:st_task/features/health/presentation/widgets/add_health_form.dart';
import 'package:st_task/features/health/presentation/widgets/health_report.dart';
import 'package:st_task/features/health/presentation/widgets/list_count_row.dart';
import 'package:st_task/features/initial/presentation/screens/getting_started_screen.dart';

import 'package:st_task/main.dart' as app;
import 'package:st_task/features/initial/presentation/screens/splash_screen.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end testing', () {
    testWidgets(
        'verify all the widgets are available and interaction is working',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // find Splash screen and logo image and title text
      expect(find.byType(SplashScreen), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(GettingStartedScreen), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      final gettingStartedImage = find.byKey(const Key("gettingStartedImage"));
      final gettingStartedTitle = find.byKey(const Key("gettingStartedTitle"));
      final gettingStartedDescription =
          find.byKey(const Key("gettingStartedDescription"));
      final gettingStartedButton =
          find.byKey(const Key("gettingStartedButton"));

      expect(gettingStartedImage, findsOneWidget);
      expect(gettingStartedTitle, findsOneWidget);
      expect(gettingStartedDescription, findsOneWidget);
      expect(gettingStartedButton, findsOneWidget);

      // Tap n Get Started button to navigate to health Home Screen
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(gettingStartedButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Find HealthHomeScreen, Add Form, List Count Row and health Report widgets
      expect(find.byType(HealthHomeScreen), findsOneWidget);
      expect(find.byType(AddHealthForm), findsOneWidget);
      expect(find.byType(ListCountRow), findsOneWidget);
      expect(find.byType(HealthReport), findsOneWidget);

      // Find 3 TextFormFields and the add button
      final sysHgTextField = find.byKey(const Key("sysHgTextField"));
      final diaHgTextField = find.byKey(const Key("diaHgTextField"));
      final pulseBpmTextField = find.byKey(const Key("pulseBpmTextField"));
      final addButton = find.byKey(const Key("addButton"));

      expect(sysHgTextField, findsOneWidget);
      expect(diaHgTextField, findsOneWidget);
      expect(pulseBpmTextField, findsOneWidget);
      expect(addButton, findsOneWidget);

      // Enter values and create a record with add button
      await tester.enterText(sysHgTextField, '90');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(diaHgTextField, '78');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(pulseBpmTextField, '99');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Tap drawer button to open drawer
      final drawerButton = find.byKey(const Key("drawerButton"));
      expect(drawerButton, findsOneWidget);
      await tester.tap(drawerButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      // Find report list tile and tap to open HealthReportScreen
      final reportButton = find.byKey(const Key("reportButton"));
      expect(reportButton, findsOneWidget);
      await tester.tap(reportButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Find health report screen and report list widget
      await Future.delayed(const Duration(seconds: 5));
      expect(find.byType(HealthReportScreen), findsOneWidget);
      expect(find.byType(HealthReport), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
