part of 'get_health_cubit.dart';

sealed class GetHealthState extends Equatable {
  const GetHealthState();

  @override
  List<Object> get props => [];
}

final class GetHealthInitial extends GetHealthState {}

final class GetHealthLoading extends GetHealthState {}

final class GetHealthError extends GetHealthState {
  final String error;
  const GetHealthError({required this.error});
}

final class GetHealthSuccess extends GetHealthState {
  final List<HealthEntity> healthData;

  const GetHealthSuccess({required this.healthData});
}
