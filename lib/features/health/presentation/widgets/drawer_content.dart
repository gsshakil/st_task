// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:st_task/core/constants/app_constants.dart';
import 'package:st_task/core/constants/asset_constants.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/helpers/navigation_helper.dart';
import 'package:st_task/core/route/routes.dart';
import 'package:st_task/core/theme/theme_utils.dart';
import 'package:st_task/core/value_notifiers.dart';
import 'package:st_task/core/widgets/language_picker_widget.dart';
import 'package:st_task/l10n/l10n.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            key: const Key(AppConstants.reportButtonKey),
            minTileHeight: 50,
            leading: SvgPicture.asset(
              AssetConstants.privacyIcon,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              context.l10n.reports,
              style: Theme.of(context).textTheme.titleSmall!.bold(),
            ),
            onTap: () {
              NavigationHelper.pushNamed(
                context,
                RouteNames.reportScreen,
              );
            },
          ).padding(top: 100),
          _buildDrawerBottomContents().padding(bottom: 80),
        ],
      ),
    );
  }

  Column _buildDrawerBottomContents() {
    return Column(
      children: [
        //Language Picker
        const LanguagePickerWidget(),

        //Theme Mode Changer
        ValueListenableBuilder(
          valueListenable: themeMode,
          builder: (context, value, child) {
            return ListTile(
              // key: const Key("darkMode"),
              minTileHeight: 50,
              leading: SvgPicture.asset(
                AssetConstants.settingIcon,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                context.l10n.darkMode,
                style: Theme.of(context).textTheme.titleSmall!.bold(),
              ),
              trailing: CupertinoSwitch(
                value: themeMode.value == ThemeMode.dark ? true : false,
                onChanged: (value) {
                  ThemeUtils.toggleThemeMode();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
