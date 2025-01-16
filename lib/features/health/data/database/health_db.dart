import 'package:logger/web.dart';
import 'package:sqflite/sqflite.dart';
import 'package:st_task/features/health/data/database/database_service.dart';
import 'package:st_task/features/health/data/database/health_fields.dart';
import 'package:st_task/features/health/data/models/health_model.dart';

class HealthDB {
  final tableName = 'health';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      ${HealthFields.id} INTEGER NOT NULL,
      ${HealthFields.sysHgMm} TEXT NOT NULL,
      ${HealthFields.diaHgMm} TEXT NOT NULL,
      ${HealthFields.pulseBpm} TEXT NOT NULL,
      ${HealthFields.createdAt} INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
      ${HealthFields.updatedAt} INTEGER,
      PRIMARY KEY ("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required HealthModel params}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (${HealthFields.sysHgMm}, ${HealthFields.diaHgMm}, ${HealthFields.pulseBpm}, ${HealthFields.createdAt}) VALUES (?,?,?,?)''',
      [
        params.sysMmHg,
        params.diaMmHg,
        params.pulseBpm,
        DateTime.now().millisecondsSinceEpoch
      ],
    );
  }

  Future<List<HealthModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final List<Map<String, Object?>> healthData = await database.rawQuery(
      '''SELECT * from $tableName ORDER BY COALESCE(${HealthFields.updatedAt}, ${HealthFields.createdAt}) DESC''',
    );

    final parsedHealthData = healthData
        .map((health) => HealthModel.fromSqfliteDatabase(health))
        .toList();

    Logger().i('All Health Data: $parsedHealthData');

    return parsedHealthData;
  }

  Future<HealthModel> fetchById(int id) async {
    final database = await DatabaseService().database;
    final health = await database.rawQuery(
      '''SELECT * from $tableName WHERE id = ?''',
      [id],
    );

    return HealthModel.fromSqfliteDatabase(health.first);
  }

  Future<int> update({required HealthModel params}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        HealthFields.sysHgMm: params.sysMmHg,
        HealthFields.diaHgMm: params.diaMmHg,
        HealthFields.pulseBpm: params.pulseBpm,
        HealthFields.updatedAt: DateTime.now().millisecondsSinceEpoch
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [params.id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE from $tableName WHERE id = ?''', [id]);
  }
}
