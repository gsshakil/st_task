import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/core/route/routes.dart';
import 'package:st_task/core/theme/app_text_theme.dart';
import 'package:st_task/core/theme/custom_color_scheme.dart';
import 'package:st_task/core/theme/theme_utils.dart';
import 'package:st_task/core/value_notifiers.dart';
import 'package:st_task/l10n/localization_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  LocalizationUtils.instance.initialize();
  ThemeUtils.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ScreenUtilInit(
        child: ValueListenableBuilder(
            valueListenable: selectedLocal,
            builder: (context, v, c) {
              return ValueListenableBuilder(
                  valueListenable: themeMode,
                  builder: (context, value, child) {
                    return MaterialApp(
                      title: 'BP Manager',
                      onGenerateTitle: (context) =>
                          AppLocalizations.of(context).jamindar,
                      theme: FlexThemeData.light(
                        useMaterial3: true,
                        colors: customFlexTheme.light,
                        textTheme: AppTextThemeData.textThemeData,
                      ),
                      darkTheme: FlexThemeData.dark(
                        useMaterial3: true,
                        colors: customFlexTheme.dark,
                        textTheme: AppTextThemeData.textThemeData,
                      ),
                      themeMode: themeMode.value,
                      onGenerateRoute: RouterClass.generateRoute,
                      debugShowCheckedModeBanner: false,
                      supportedLocales: AppLocalizations.supportedLocales,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      locale: selectedLocal.value,
                      initialRoute: RouteNames.splashScreen,
                    );
                  });
            }),
      ),
    );
  }
}
