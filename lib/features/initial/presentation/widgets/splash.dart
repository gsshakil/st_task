import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:st_task/core/constants/asset_constants.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/l10n/l10n.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: Image.asset(AssetConstants.appIcon),
            )
                .animate()
                .fadeIn()
                .scale()
                .move(delay: 1000.ms, duration: 2000.ms),
            Text(
              context.l10n.title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.bold()
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )
                .padding(top: 125)
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
