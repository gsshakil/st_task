import 'package:equatable/equatable.dart';

class HealthEntity extends Equatable {
  final int? id;
  final String sysMmHg;
  final String diaMmHg;
  final String pulseBpm;
  final String? createdAt;
  final String? updatedAt;

  const HealthEntity({
    required this.id,
    required this.sysMmHg,
    required this.diaMmHg,
    required this.pulseBpm,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        sysMmHg,
        diaMmHg,
        pulseBpm,
        createdAt,
        updatedAt,
      ];
}
