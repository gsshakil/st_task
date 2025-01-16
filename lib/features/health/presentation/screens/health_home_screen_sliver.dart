// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:st_task/core/di.dart';
// import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
// import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';
// import 'package:st_task/features/health/presentation/widgets/add_health_form.dart';
// import 'package:st_task/features/health/presentation/widgets/drawer_content.dart';
// import 'package:st_task/features/health/presentation/widgets/health_report.dart';
// import 'package:st_task/features/health/presentation/widgets/list_count_row.dart';
// import 'package:st_task/features/health/presentation/widgets/sliver_persistent_header_delegate.dart';
// import 'package:st_task/l10n/l10n.dart';

// class HealthHomeScreenSliver extends StatefulWidget {
//   const HealthHomeScreenSliver({super.key});

//   @override
//   State<HealthHomeScreenSliver> createState() => _HealthHomeScreenSliverState();
// }

// class _HealthHomeScreenSliverState extends State<HealthHomeScreenSliver> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     final healthCubit = injector<HealthCubit>();
//     final getHealthCubit = injector<GetHealthCubit>();

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider.value(value: healthCubit),
//         BlocProvider.value(value: getHealthCubit..getAllHealthData()),
//       ],
//       child: BlocListener<HealthCubit, HealthState>(
//         listener: (context, state) {},
//         child: Scaffold(
//           drawer: const DrawerContent(),
//           body: CustomScrollView(
//               controller: _scrollController,
//               physics: const AlwaysScrollableScrollPhysics(),
//               slivers: [
//                 SliverAppBar(
//                   floating: true,
//                   elevation: 0,
//                   title:
//                       Text(context.l10n.trackYourDailyHealth).animate().fadeIn(
//                             delay: 200.ms,
//                             duration: 2000.ms,
//                           ),
//                   centerTitle: true,
//                   backgroundColor:
//                       Theme.of(context).colorScheme.primary.withOpacity(0.1),
//                 ),

//                 //Add Data Form
//                 SliverToBoxAdapter(
//                   child: AddHealthForm()
//                       .animate()
//                       .fadeIn(delay: 0.ms, duration: 2000.ms),
//                 ),

//                 //Row Count
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: SliverDelegate(
//                     callback: (val) {},
//                     child: Container(
//                       height: 50,
//                       width: ScreenUtil().screenWidth,
//                       child: BlocBuilder<GetHealthCubit, GetHealthState>(
//                         builder: (context, state) {
//                           if (state is GetHealthSuccess) {
//                             return ListCountRow(count: state.healthData.length);
//                           } else {
//                             return const SizedBox();
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 //Health Data Report
//                 SliverToBoxAdapter(
//                   child: HealthReport().animate().fadeIn(
//                         delay: 200.ms,
//                         duration: 2000.ms,
//                       ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
