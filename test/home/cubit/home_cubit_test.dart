import 'package:bloc_test/bloc_test.dart';
import 'package:delosi_test/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emite matriz rotada cuando se llama a rotateLeftTest',
      build: () => HomeCubit()..onInputChanged('[[1,2,3],[4,5,6],[7,8,9]]'),
      act: (cubit) => cubit.rotateLeftTest(),
      expect: () => [
        isA<HomeState>().having((state) => state.matrix, 'matrix', [
          [3, 6, 9],
          [2, 5, 8],
          [1, 4, 7],
        ]),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emite matriz rotada cuando se llama a rotateRightTest',
      build: () => HomeCubit()..onInputChanged('[[1,2,3],[4,5,6],[7,8,9]]'),
      act: (cubit) => cubit.rotateRightTest(),
      expect: () => [
        isA<HomeState>().having((state) => state.matrix, 'matrix', [
          [7, 4, 1],
          [8, 5, 2],
          [9, 6, 3],
        ]),
      ],
    );
  });
}
