import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/l10n/l10n.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.l10n.jamindar,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.bold()
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
