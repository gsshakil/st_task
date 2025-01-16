import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_task/core/constants/app_constants.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
import 'package:st_task/features/health/presentation/widgets/add_health_form.dart';
import 'package:st_task/features/health/presentation/widgets/drawer_content.dart';
import 'package:st_task/features/health/presentation/widgets/health_report.dart';
import 'package:st_task/features/health/presentation/widgets/list_count_row.dart';
import 'package:st_task/l10n/l10n.dart';

class HealthHomeScreen extends StatelessWidget {
  const HealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    final healthCubit = injector<HealthCubit>();
    final getHealthCubit = injector<GetHealthCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: healthCubit),
        BlocProvider.value(value: getHealthCubit..getAllHealthData()),
      ],
      child: BlocListener<HealthCubit, HealthState>(
        listener: (context, state) {},
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(context.l10n.trackYourDailyHealth)
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 2000.ms),
              centerTitle: true,
              leading: IconButton(
                key: const Key(AppConstants.drawerButtonKey),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            drawer: const DrawerContent(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Add Data Form
                AddHealthForm()
                    .animate()
                    .fadeIn(delay: 0.ms, duration: 2000.ms),

                //count row
                BlocBuilder<GetHealthCubit, GetHealthState>(
                  builder: (context, state) {
                    if (state is GetHealthSuccess) {
                      return ListCountRow(count: state.healthData.length);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

                //Health Data Report
                Expanded(
                  child: HealthReport()
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 2000.ms),
                ),
              ],
            )),
      ),
    );
  }
}
