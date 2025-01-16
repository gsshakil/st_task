import 'package:st_task/features/health/data/database/health_fields.dart';
import 'package:st_task/features/health/domain/entities/health_entity.dart';

class HealthModel extends HealthEntity {
  const HealthModel({
    super.id,
    required super.sysMmHg,
    required super.diaMmHg,
    required super.pulseBpm,
    super.createdAt,
    super.updatedAt,
  });

  HealthModel copyWith(
    final int? id,
    final String? sysMmHg,
    final String? diaMmHg,
    final String? pulseBpm,
    final String? createdAt,
    final String? updatedAt,
  ) {
    return HealthModel(
      id: id ?? this.id,
      sysMmHg: sysMmHg ?? this.sysMmHg,
      diaMmHg: this.diaMmHg,
      pulseBpm: this.pulseBpm,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    );
  }

  factory HealthModel.init() => const HealthModel(
        id: 0,
        sysMmHg: '',
        diaMmHg: '',
        pulseBpm: '',
        createdAt: '',
        updatedAt: '',
      );

  factory HealthModel.fromJson(Map<String, dynamic> json) => HealthModel(
        id: json[HealthFields.id] ?? '',
        sysMmHg: json[HealthFields.sysHgMm] ?? '',
        diaMmHg: json[HealthFields.diaHgMm] ?? '',
        pulseBpm: json[HealthFields.pulseBpm] ?? '',
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json[HealthFields.createdAt])
                .toIso8601String(),
        updatedAt: json[HealthFields.updatedAt] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json[HealthFields.updatedAt])
                .toIso8601String(),
      );

  factory HealthModel.fromSqfliteDatabase(Map<String, dynamic> json) =>
      HealthModel(
        id: json[HealthFields.id] ?? '',
        sysMmHg: json[HealthFields.sysHgMm] ?? '',
        diaMmHg: json[HealthFields.diaHgMm] ?? '',
        pulseBpm: json[HealthFields.pulseBpm] ?? '',
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json[HealthFields.createdAt])
                .toIso8601String(),
        updatedAt: json[HealthFields.updatedAt] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json[HealthFields.updatedAt])
                .toIso8601String(),
      );

  Map<String, dynamic> toJson() => {
        HealthFields.id: id,
        HealthFields.sysHgMm: sysMmHg,
        HealthFields.diaHgMm: diaMmHg,
        HealthFields.pulseBpm: pulseBpm,
        HealthFields.createdAt: createdAt,
        HealthFields.updatedAt: updatedAt,
      };
}
