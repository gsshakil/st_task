import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:st_task/core/constants/asset_constants.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/helpers/navigation_helper.dart';
import 'package:st_task/core/route/routes.dart';
import 'package:st_task/core/widgets/k_primary_button.dart';

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
              AssetConstants.gettingStartedImage,
              height: ScreenUtil().screenHeight * 0.3,
            ).padding(bottom: 20),
            Text(
              "Track your Daily Health",
              style: appTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              "Experience the power of AI-generated insights. Our advanced AI algorithms process the reports in real-time, providing you with detailed and accurate analysis.",
              style: appTextTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            KPrimaryButton(
              title: 'Get Started',
              onPressed: () {
                NavigationHelper.pushNamed(
                  context,
                  RouteNames.healthHomeScreen,
                );
              },
            ).padding(bottom: 80),
          ],
        ),
      ),
    );
  }
}
