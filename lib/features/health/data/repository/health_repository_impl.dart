import 'package:dartz/dartz.dart';
import 'package:st_task/core/helpers/exceptions.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/data/data_sources/local_data_source/health_local_data_source.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';
import 'package:st_task/features/health/domain/repository/health_repository.dart';

class HealthRepositoryImpl extends HealthRepository {
  final HealthLocalDataSource healthLocalDataSource;

  HealthRepositoryImpl({required this.healthLocalDataSource});

  @override
  Future<Either<Failure, void>> insertHealthData({
    required HealthModel healthModel,
  }) async {
    try {
      void result = await healthLocalDataSource.insertHealthData(
          healthModel: healthModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> updateHealthData({
    required HealthModel healthModel,
  }) async {
    try {
      void result = await healthLocalDataSource.insertHealthData(
          healthModel: healthModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHealthData({required int id}) async {
    try {
      void result = await healthLocalDataSource.deleteHealthData(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure, List<HealthEntity>>> getAllHealthData() async {
    try {
      List<HealthEntity> result =
          await healthLocalDataSource.getAllHealthData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(exception: e));
    }
  }
}
