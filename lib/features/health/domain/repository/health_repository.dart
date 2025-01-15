import 'package:dartz/dartz.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';

abstract class HealthRepository {
  Future<Either<Failure, void>> insertHealthData({
    required HealthModel healthModel,
  });

  Future<Either<Failure, void>> updateHealthData({
    required HealthModel healthModel,
  });

  Future<Either<Failure, void>> deleteHealthData({required int id});

  Future<Either<Failure, List<HealthEntity>>> getAllHealthData();
}
