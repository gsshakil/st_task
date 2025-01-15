import 'package:dartz/dartz.dart';
import 'package:st_task/core/helpers/failure.dart';
import 'package:st_task/features/health/domain/repository/health_repository.dart';

class DeleteHealthDataUseCase {
  HealthRepository healthRepository;

  DeleteHealthDataUseCase({required this.healthRepository});

  Future<Either<Failure, void>> call({required int id}) async {
    return await healthRepository.deleteHealthData(id: id);
  }
}
