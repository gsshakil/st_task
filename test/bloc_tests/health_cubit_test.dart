import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:st_task/features/health/data/models/health_model.dart';
import 'package:st_task/features/health/domain/use_cases/delete_health_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/insert_heath_data_usecase.dart';
import 'package:st_task/features/health/domain/use_cases/update_health_data_usecase.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';

class MockInsertHealthDataUseCase extends Mock
    implements InsertHealthDataUseCase {}

class MockUpdateHealthDataUseCase extends Mock
    implements UpdateHealthDataUseCase {}

class MockDeleteHealthDataUseCase extends Mock
    implements DeleteHealthDataUseCase {}

void main() {
  group('HealthCubit', () {
    final mockInsertHealthDataUseCase = MockInsertHealthDataUseCase();
    final mockUpdateHealthDataUseCase = MockUpdateHealthDataUseCase();
    final mockDeleteHealthDataUseCase = MockDeleteHealthDataUseCase();

    final healthModel = HealthModel(
      id: 1,
      sysMmHg: '99',
      diaMmHg: '108',
      pulseBpm: '120',
    );

    blocTest<HealthCubit, HealthState>(
      'handles InsertHealthData successfully',
      build: () => HealthCubit(
        insertHealthDataUseCase: mockInsertHealthDataUseCase,
        updateHealthDataUseCase: mockUpdateHealthDataUseCase,
        deleteHealthDataUseCase: mockDeleteHealthDataUseCase,
      ),
      setUp: () {
        when(() => mockInsertHealthDataUseCase(healthModel: healthModel))
            .thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit.insertHealthData(healthModel: healthModel),
      expect: () => <HealthState>[HealthLoading(), HealthSuccess()],
    );

    blocTest<HealthCubit, HealthState>(
      'handles UpdateHealthData successfully',
      build: () => HealthCubit(
        insertHealthDataUseCase: mockInsertHealthDataUseCase,
        updateHealthDataUseCase: mockUpdateHealthDataUseCase,
        deleteHealthDataUseCase: mockDeleteHealthDataUseCase,
      ),
      setUp: () {
        when(() => mockUpdateHealthDataUseCase(healthModel: healthModel))
            .thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit.updateHealthData(healthModel: healthModel),
      expect: () => <HealthState>[HealthLoading(), HealthSuccess()],
    );

    blocTest<HealthCubit, HealthState>(
      'handles DeleteHealthData successfully',
      build: () => HealthCubit(
        insertHealthDataUseCase: mockInsertHealthDataUseCase,
        updateHealthDataUseCase: mockUpdateHealthDataUseCase,
        deleteHealthDataUseCase: mockDeleteHealthDataUseCase,
      ),
      setUp: () {
        when(() => mockDeleteHealthDataUseCase(id: 1))
            .thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit.deleteHealthData(id: 1),
      expect: () => <HealthState>[HealthLoading(), HealthSuccess()],
    );
  });
}
