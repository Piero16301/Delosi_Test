import 'package:bloc_test/bloc_test.dart';
import 'package:delosi_test/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.byType(HomeView), findsOneWidget);
    });
  });

  group('HomeView', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = MockHomeCubit();
    });

    testWidgets('renders current matrix', (tester) async {
      const matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ];
      when(() => homeCubit.state).thenReturn(
        const HomeState(matrix: matrix),
      );
      when(() => homeCubit.state).thenReturn(
        const HomeState(matrix: matrix),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: const HomeView(),
        ),
      );
      expect(find.byKey(const Key('matrix_output')), findsOneWidget);
    });
  });
}
