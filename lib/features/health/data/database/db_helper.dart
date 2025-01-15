import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:st_task/features/health/data/database/health_fields.dart';

class HealthDataBase {
  HealthDataBase._();

  static final HealthDataBase instance = HealthDataBase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If the health database does not exist, create it
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final String path = join(await getDatabasesPath(), 'health_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables and define schema
        await db.execute('''
          CREATE TABLE  ${HealthFields.tableName} (
             ${HealthFields.id} ${HealthFields.idType},
             ${HealthFields.sysHgMm} ${HealthFields.textType},
             ${HealthFields.diaHgMm} ${HealthFields.textType},
             ${HealthFields.pulseBpm} ${HealthFields.textType},
            ${HealthFields.createdAt} INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
            ${HealthFields.updatedAt} ${HealthFields.intType}
          )
        ''');
      },
    );
  }
}
