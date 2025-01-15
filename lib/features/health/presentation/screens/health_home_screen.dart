import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/core/extensions/widget_extensions.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
import 'package:st_task/features/health/presentation/widgets/add_health_form.dart';
import 'package:st_task/features/health/presentation/widgets/drawer_content.dart';
import 'package:st_task/features/health/presentation/widgets/health_report.dart';

class HealthHomeScreen extends StatelessWidget {
  const HealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            appBar: AppBar(
              title: const Text('Track Daily Health'),
            ),
            drawer: const DrawerContent(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Add Data Form
                const AddHealthForm().padding(bottom: 20),
                //Health Data Report
                const HealthReport(),
              ],
            )),
      ),
    );
  }
}
