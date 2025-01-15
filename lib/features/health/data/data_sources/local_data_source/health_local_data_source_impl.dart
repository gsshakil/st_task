import 'package:st_task/features/health/data/data_sources/local_data_source/health_local_data_source.dart';
import 'package:st_task/features/health/data/database/db_helper.dart';
import 'package:st_task/features/health/data/database/health_fields.dart';
import 'package:st_task/features/health/data/models/health_model.dart';

class HealthLocalDataSourceImpl extends HealthLocalDataSource {
  final HealthDataBase healthDataBase;

  HealthLocalDataSourceImpl({required this.healthDataBase});

  @override
  Future<void> insertHealthData({required HealthModel healthModel}) async {
    final db = await healthDataBase.database;
    await db.insert(HealthFields.tableName, healthModel.toJson());
  }

  @override
  Future<void> deleteHealthData({required int id}) async {
    final db = await healthDataBase.database;
    await db.delete(HealthFields.tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> updateHealthData({required HealthModel healthModel}) async {
    final db = await healthDataBase.database;
    await db.update(HealthFields.tableName, healthModel.toJson(),
        where: 'id = ?', whereArgs: [healthModel.id]);
  }

  @override
  Future<List<HealthModel>> getAllHealthData() async {
    final db = await healthDataBase.database;

    final List<Map<String, dynamic>> maps =
        await db.query(HealthFields.tableName);

    return List.generate(maps.length, (i) {
      return HealthModel.fromJson(maps[i]);
    });
  }
}
