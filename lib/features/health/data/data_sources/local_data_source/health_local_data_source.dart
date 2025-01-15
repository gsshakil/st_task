import 'package:st_task/features/health/data/models/health_model.dart';

abstract class HealthLocalDataSource {
  Future<void> insertHealthData({required HealthModel healthModel});

  Future<void> updateHealthData({required HealthModel healthModel});

  Future<void> deleteHealthData({required int id});

  Future<List<HealthModel>> getAllHealthData();
}
