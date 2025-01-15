import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:st_task/core/widgets/app_error_widget.dart';
import 'package:st_task/core/widgets/loading_indicator.dart';
import 'package:st_task/core/widgets/no_data_found.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';

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
          return SizedBox(
            height: isReportScreen
                ? ScreenUtil().screenHeight
                : ScreenUtil().screenHeight * 0.55,
            child: state.healthData.isEmpty
                ? const NoDataFound()
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('120/75 mm Hg'),
                            Text('p80'),
                          ],
                        ),
                        leading: Icon(Icons.healing_outlined),
                        trailing: Icon(Icons.arrow_downward_outlined),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
          );
        } else {
          return LoadingIndicator(
            color: Theme.of(context).colorScheme.error,
          );
        }
      },
    );
  }
}
