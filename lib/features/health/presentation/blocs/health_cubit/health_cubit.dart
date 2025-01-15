// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/domain/use_cases/delete_health_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/insert_heath_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/update_health_data_usecase.dart';

part 'health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  final InsertHealthDataUseCase insertHealthDataUseCase;
  final UpdateHealthDataUseCase updateHealthDataUseCase;
  final DeleteHealthDataUseCase deleteHealthDataUseCase;

  HealthCubit({
    required this.insertHealthDataUseCase,
    required this.updateHealthDataUseCase,
    required this.deleteHealthDataUseCase,
  }) : super(HealthInitial());

  void insertHealthData({required HealthModel healthModel}) async {
    emit(HealthLoading());
    try {
      Either<Failure, void> result =
          await insertHealthDataUseCase(healthModel: healthModel);

      result.fold((l) => emit(HealthError(error: l.toString())), (r) {
        emit(HealthSuccess());
      });
    } catch (e) {
      emit(HealthError(error: e.toString()));
    }
  }

  void updateHealthData({required HealthModel healthModel}) async {
    emit(HealthLoading());
    try {
      Either<Failure, void> result =
          await updateHealthDataUseCase(healthModel: healthModel);

      result.fold((l) => emit(HealthError(error: l.toString())), (r) {
        emit(HealthSuccess());
      });
    } catch (e) {
      emit(HealthError(error: e.toString()));
    }
  }

  void deleteHealthData({required int id}) async {
    emit(HealthLoading());
    try {
      Either<Failure, void> result = await deleteHealthDataUseCase(id: id);

      result.fold((l) => emit(HealthError(error: l.toString())), (r) {
        emit(HealthSuccess());
      });
    } catch (e) {
      emit(HealthError(error: e.toString()));
    }
  }
}
