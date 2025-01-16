import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_task/core/di.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
import 'package:st_task/features/health/presentation/widgets/health_report.dart';
import 'package:st_task/l10n/l10n.dart';

class HealthReportScreen extends StatelessWidget {
  const HealthReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final healthCubit = injector<HealthCubit>();
    final getHealthCubit = injector<GetHealthCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: healthCubit),
        BlocProvider.value(value: getHealthCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.yourHealthReport),
          centerTitle: true,
        ),
        body: const HealthReport(),
      ),
    );
  }
}
