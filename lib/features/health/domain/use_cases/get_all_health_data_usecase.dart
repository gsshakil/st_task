import 'package:dartz/dartz.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';
import 'package:st_task/features/health/domain/repository/health_repository.dart';

class GetAllHealthDataUseCase {
  HealthRepository healthRepository;

  GetAllHealthDataUseCase({required this.healthRepository});

  Future<Either<Failure, List<HealthEntity>>> call() async {
    return await healthRepository.getAllHealthData();
  }
}
