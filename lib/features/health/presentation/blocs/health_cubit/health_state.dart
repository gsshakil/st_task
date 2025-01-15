part of 'health_cubit.dart';

sealed class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object> get props => [];
}

final class HealthInitial extends HealthState {}

final class HealthLoading extends HealthState {}

final class HealthError extends HealthState {
  final String error;
  const HealthError({required this.error});
}

final class HealthSuccess extends HealthState {}
