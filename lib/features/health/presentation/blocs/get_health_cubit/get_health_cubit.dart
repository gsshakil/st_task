// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';
import 'package:st_task/features/health/domain/use_cases/get_all_health_data_usecase.dart';

part 'get_health_state.dart';

class GetHealthCubit extends Cubit<GetHealthState> {
  final GetAllHealthDataUseCase getAllHealthDataUseCase;

  GetHealthCubit({
    required this.getAllHealthDataUseCase,
  }) : super(GetHealthInitial());

  void getAllHealthData() async {
    emit(GetHealthLoading());
    try {
      Either<Failure, List<HealthEntity>> result =
          await getAllHealthDataUseCase();

      result.fold((l) => emit(GetHealthError(error: l.toString())), (r) {
        emit(GetHealthSuccess(healthData: r));
      });
    } catch (e) {
      emit(GetHealthError(error: e.toString()));
    }
  }
}
