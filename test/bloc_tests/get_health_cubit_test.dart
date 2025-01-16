import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:st_task/features/health/domain/use_cases/get_all_health_data_usecase.dart';
import 'package:st_task/features/health/presentation/blocs/get_health_cubit/get_health_cubit.dart';
import 'package:st_task/features/health/presentation/blocs/health_cubit/health_cubit.dart';

class MockGetAllHealthDataUseCase extends Mock
    implements GetAllHealthDataUseCase {}

void main() {
  group('GetHealthCubit', () {
    final mockGetAllHealthDataUseCase = MockGetAllHealthDataUseCase();

    blocTest<GetHealthCubit, GetHealthState>(
      'handles get health data successfully',
      build: () => GetHealthCubit(
        getAllHealthDataUseCase: mockGetAllHealthDataUseCase,
      ),
      setUp: () {
        when(() => mockGetAllHealthDataUseCase())
            .thenAnswer((_) async => const Right([]));
      },
      act: (cubit) => cubit.getAllHealthData(),
      expect: () => <GetHealthState>[
        GetHealthLoading(),
        GetHealthSuccess(healthData: [])
      ],
    );
  });
}
