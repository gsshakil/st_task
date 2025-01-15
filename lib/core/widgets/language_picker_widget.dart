// ignore_for_file: deprecated_member_use

import 'package:st_task/core/constants/asset_constants.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/value_notifiers.dart';
import 'package:st_task/l10n/l10n.dart';
import 'package:st_task/l10n/localization_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({
    super.key,
    this.isDense = false,
  });

  final bool isDense;
  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  List<Locale> appLocales = [];

  @override
  void initState() {
    appLocales = AppLocalizations.supportedLocales;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDialogItem(Language language) => Row(
          children: <Widget>[
            Text(language.nativeName),
            const SizedBox(width: 8.0),
            Flexible(child: Text("(${language.isoCode})"))
          ],
        );
    void openLanguagePickerDialog() => showDialog(
          context: context,
          builder: (context) => Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Theme.of(context).colorScheme.primary,
            ),
            child: LanguagePickerDialog(
              languages: [
                Languages.english,
                Languages.bengali,
                // Languages.arabic,
              ],
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: Theme.of(context).colorScheme.primary,
              searchInputDecoration:
                  const InputDecoration(hintText: 'Search...'),
              isSearchable: false,
              title: Text(context.l10n.selectYourLanguage),
              onValuePicked: (Language language) {
                if (language == Languages.bengali) {
                  LocalizationUtils.instance.changeLocale(
                    locale: const Locale('bn'),
                    systemDefault: true,
                  );
                } else if (language == Languages.arabic) {
                  LocalizationUtils.instance.changeLocale(
                    locale: const Locale('ar'),
                    systemDefault: true,
                  );
                }
                if (language == Languages.english) {
                  LocalizationUtils.instance.changeLocale(
                    locale: const Locale('en'),
                    systemDefault: true,
                  );
                }
              },
              itemBuilder: buildDialogItem,
            ),
          ),
        );

    return ValueListenableBuilder(
        valueListenable: selectedLocal,
        builder: (context, value, child) {
          return widget.isDense
              ? InkWell(
                  onTap: () {
                    openLanguagePickerDialog();
                  },
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(end: 5),
                        child: Icon(Icons.language),
                      ),
                      Text(
                        convertToLanguage(selectedLocal.value.languageCode)
                            .nativeName,
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                )
              : ListTile(
                  minTileHeight: 80,
                  leading: SvgPicture.asset(AssetConstants.language2Icon,
                      color: Theme.of(context).colorScheme.onSurface),
                  title: Text(
                    context.l10n.languages,
                    style: Theme.of(context).textTheme.titleSmall!.bold(),
                  ),
                  trailing: Text(
                    convertToLanguage(selectedLocal.value.languageCode)
                        .nativeName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onTap: () {
                    openLanguagePickerDialog();
                  },
                );
        });
  }

  Language convertToLanguage(String languageCode) {
    if (languageCode == 'en') {
      return Languages.english;
    }
    if (languageCode == 'bn') {
      return Languages.bengali;
    } else if (languageCode == 'ar') {
      return Languages.arabic;
    } else {
      return Languages.english;
    }
  }
}
