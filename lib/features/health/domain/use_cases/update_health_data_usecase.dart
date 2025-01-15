import 'package:dartz/dartz.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/domain/repository/health_repository.dart';

class UpdateHealthDataUseCase {
  HealthRepository healthRepository;

  UpdateHealthDataUseCase({required this.healthRepository});

  Future<Either<Failure, void>> call({required HealthModel healthModel}) async {
    return await healthRepository.insertHealthData(healthModel: healthModel);
  }
}
