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
    final DateTime? createdAt,
    final DateTime? updatedAt,
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

  factory HealthModel.init() => HealthModel(
        id: 0,
        sysMmHg: '',
        diaMmHg: '',
        pulseBpm: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory HealthModel.fromJson(Map<String, dynamic> json) => HealthModel(
        id: json[HealthFields.id] ?? '',
        sysMmHg: json[HealthFields.sysHgMm] ?? '',
        diaMmHg: json[HealthFields.diaHgMm] ?? '',
        pulseBpm: json[HealthFields.pulseBpm] ?? '',
        createdAt:
            DateTime.tryParse(json[HealthFields.createdAt] as String? ?? ''),
        updatedAt:
            DateTime.tryParse(json[HealthFields.updatedAt] as String? ?? ''),
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
