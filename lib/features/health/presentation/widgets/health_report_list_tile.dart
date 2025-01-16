import 'package:flutter/material.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/core/extensions/date_format_utils.dart';
import 'package:st_task/core/extensions/text_style_extensions.dart';
import 'package:st_task/core/helpers/feedback_helper.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
import 'package:st_task/l10n/l10n.dart';

class HeathReportListTile extends StatelessWidget {
  const HeathReportListTile({
    super.key,
    required this.item,
  });

  final HealthEntity item;

  @override
  Widget build(BuildContext context) {
    final healthCubit = injector<HealthCubit>();
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        healthCubit.deleteHealthData(id: item.id!);

        FeedBackHelper.showSuccessSnackBar(
          context: context,
          title: context.l10n.removed,
          content: context.l10n.itemRemoved,
        );
      },
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${item.sysMmHg} / ${item.diaMmHg} mm Hg'),
            Text(item.pulseBpm),
          ],
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormatUtils.formatDate(DateTime.parse(item.createdAt!)),
              style: Theme.of(context).textTheme.titleSmall?.bold(),
            ),
            Text(
              DateFormatUtils.formatTime(DateTime.parse(item.createdAt!)),
            ),
          ],
        ),
        trailing: int.tryParse(item.pulseBpm) != null &&
                int.tryParse(item.pulseBpm)! > 90
            ? const Icon(
                Icons.arrow_upward,
                color: Colors.green,
              )
            : const Icon(
                Icons.arrow_downward_outlined,
                color: Colors.red,
              ),
      ),
    );
  }
}
