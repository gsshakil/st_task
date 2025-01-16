import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/core/widgets/app_error_widget.dart';
import 'package:st_task/core/widgets/loading_indicator.dart';
import 'package:st_task/core/widgets/no_data_found.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/widgets/health_report_list_tile.dart';

class HealthReport extends StatelessWidget {
  const HealthReport({
    super.key,
    this.isReportScreen = false,
  });

  final bool isReportScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHealthCubit, GetHealthState>(
      builder: (context, state) {
        if (state is GetHealthLoading) {
          return const LoadingIndicator();
        } else if (state is GetHealthError) {
          return AppErrorWidget(errorMessage: state.error);
        } else if (state is GetHealthSuccess) {
          return state.healthData.isEmpty
              ? const Center(child: NoDataFound())
              : RefreshIndicator(
                  onRefresh: () async {
                    injector<GetHealthCubit>().getAllHealthData();
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.healthData.length,
                    itemBuilder: (context, index) {
                      final item = state.healthData[index];
                      return HeathReportListTile(item: item)
                          .padding(top: index == 0 ? 10 : 0);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                );
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}
