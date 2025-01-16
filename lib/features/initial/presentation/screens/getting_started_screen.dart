import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:st_task/core/constants/asset_constants.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/helpers/navigation_helper.dart';
import 'package:st_task/core/route/routes.dart';
import 'package:st_task/core/widgets/k_primary_button.dart';
import 'package:st_task/l10n/l10n.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              key: const Key("gettingStartedImage"),
              AssetConstants.gettingStartedImage,
              height: ScreenUtil().screenHeight * 0.3,
            )
                .padding(bottom: 20)
                .animate()
                .fadeIn()
                .scale()
                .move(delay: 1000.ms, duration: 2000.ms),
            Text(
              key: const Key("gettingStartedTitle"),
              context.l10n.trackYourDailyHealth,
              style: appTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ).animate().fadeIn().move(delay: 1000.ms, duration: 2000.ms),
            SizedBox(height: 20.h),
            Text(
              key: const Key("gettingStartedDescription"),
              context.l10n.shortDescription,
              style: appTextTheme.titleSmall,
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 2000.ms),
            SizedBox(height: 40.h),
            KPrimaryButton(
              key: const Key("gettingStartedButton"),
              title: context.l10n.getStarted,
              onPressed: () {
                NavigationHelper.pushNamed(
                  context,
                  RouteNames.healthHomeScreen,
                );
              },
            )
                .padding(bottom: 80)
                .animate()
                .fadeIn()
                .scale()
                .move(delay: 1000.ms, duration: 2000.ms),
          ],
        ),
      ),
    );
  }
}
