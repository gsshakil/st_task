import 'package:flutter/material.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/helpers/navigation_helper.dart';
import 'package:st_task/core/route/routes.dart';
import 'package:st_task/l10n/l10n.dart';

class ListCountRow extends StatelessWidget {
  const ListCountRow({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                count.toString(),
                style: Theme.of(context).textTheme.labelLarge?.bold(),
              ).padding(right: 5),
              Text(context.l10n.records),
            ],
          ),
          IconButton(
            onPressed: () {
              NavigationHelper.pushNamed(
                context,
                RouteNames.reportScreen,
              );
            },
            icon: Icon(
              Icons.dashboard,
              color: Theme.of(context).hintColor,
            ),
          )
        ],
      ),
    );
  }
}
