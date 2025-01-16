import 'package:st_task/features/health/data/data_sources/local_data_source/health_local_data_source.dart';
import 'package:st_task/features/health/data/database/health_db.dart';
import 'package:st_task/features/health/data/models/health_model.dart';

class HealthLocalDataSourceImpl extends HealthLocalDataSource {
  final HealthDB healthDB;

  HealthLocalDataSourceImpl({required this.healthDB});

  @override
  Future<void> insertHealthData({required HealthModel healthModel}) async {
    await healthDB.create(params: healthModel);
  }

  @override
  Future<void> deleteHealthData({required int id}) async {
    await healthDB.delete(id);
  }

  @override
  Future<void> updateHealthData({required HealthModel healthModel}) async {
    await healthDB.update(params: healthModel);
  }

  @override
  Future<List<HealthModel>> getAllHealthData() async {
    return await healthDB.fetchAll();
  }
}
