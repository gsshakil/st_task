import 'package:get_it/get_it.dart';
import 'package:st_task/features/health/data/data_sources/local_data_source/health_local_data_source.dart';
import 'package:st_task/features/health/data/data_sources/local_data_source/health_local_data_source_impl.dart';
import 'package:st_task/features/health/data/database/health_db.dart';
import 'package:st_task/features/health/data/repository/health_repository_impl.dart';
import 'package:st_task/features/health/domain/repository/health_repository.dart';
import 'package:st_task/features/health/domain/use_cases/delete_health_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/get_all_health_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/insert_heath_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/update_health_data_usecase.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  injector.registerLazySingleton<HealthDB>(() => HealthDB());

//DATASOURCE
  injector.registerLazySingleton<HealthLocalDataSource>(
      () => HealthLocalDataSourceImpl(healthDB: injector()));

//REPOSITORY
  injector.registerLazySingleton<HealthRepository>(
      () => HealthRepositoryImpl(healthLocalDataSource: injector()));

//USECASES
  injector.registerLazySingleton<InsertHealthDataUseCase>(
      () => InsertHealthDataUseCase(healthRepository: injector()));

  injector.registerLazySingleton<UpdateHealthDataUseCase>(
      () => UpdateHealthDataUseCase(healthRepository: injector()));

  injector.registerLazySingleton<DeleteHealthDataUseCase>(
      () => DeleteHealthDataUseCase(healthRepository: injector()));

  injector.registerLazySingleton<GetAllHealthDataUseCase>(
      () => GetAllHealthDataUseCase(healthRepository: injector()));

  //BLOC/CUBITS
  injector.registerLazySingleton<GetHealthCubit>(
    () => GetHealthCubit(
      getAllHealthDataUseCase: injector(),
    ),
  );

  injector.registerLazySingleton<HealthCubit>(
    () => HealthCubit(
      insertHealthDataUseCase: injector(),
      updateHealthDataUseCase: injector(),
      deleteHealthDataUseCase: injector(),
    ),
  );
}
