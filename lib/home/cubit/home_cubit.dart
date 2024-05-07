import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void initFormKey() {
    emit(state.copyWith(formKey: GlobalKey<FormState>()));
  }

  void onInputChanged(String? value) {
    emit(state.copyWith(input: value));
  }

  Future<void> rotateLeft() async {
    emit(state.copyWith(processStatus: ProcessStatus.loading));
    try {
      // Parsear la matriz de entrada
      final matrix = await Future(
        () => state.input
            .replaceAll(RegExp(r'\s+'), '')
            .substring(2, state.input.length - 2)
            .split('],[')
            .map((e) => e.split(',').map(int.parse).toList())
            .toList(),
      );

      // Comprobar si la matriz es cuadrada
      if (matrix.length != matrix[0].length) {
        emit(
          state.copyWith(
            processStatus: ProcessStatus.failure,
            errorMessage: 'La matriz no es cuadrada',
          ),
        );
        return;
      }

      // Rotar la matriz
      final rotatedMatrix = await Future(
        () => List.generate(
          matrix[0].length,
          (i) => List.generate(
            matrix.length,
            (j) => matrix[j][matrix[j].length - i - 1],
          ),
        ),
      );

      await Future<void>.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          processStatus: ProcessStatus.success,
          matrix: rotatedMatrix,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          processStatus: ProcessStatus.failure,
          errorMessage: 'Error al rotar la matriz',
        ),
      );
    }
  }

  Future<void> rotateRight() async {
    emit(state.copyWith(processStatus: ProcessStatus.loading));
    try {
      // Parsear la matriz de entrada
      final matrix = await Future(
        () => state.input
            .replaceAll(RegExp(r'\s+'), '')
            .substring(2, state.input.length - 2)
            .split('],[')
            .map((e) => e.split(',').map(int.parse).toList())
            .toList(),
      );

      // Comprobar si la matriz es cuadrada
      if (matrix.length != matrix[0].length) {
        emit(
          state.copyWith(
            processStatus: ProcessStatus.failure,
            errorMessage: 'La matriz no es cuadrada',
          ),
        );
        return;
      }

      // Rotar la matriz
      final rotatedMatrix = await Future(
        () => List.generate(
          matrix[0].length,
          (i) => List.generate(
            matrix.length,
            (j) => matrix[matrix.length - j - 1][i],
          ),
        ),
      );

      await Future<void>.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          processStatus: ProcessStatus.success,
          matrix: rotatedMatrix,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          processStatus: ProcessStatus.failure,
          errorMessage: 'Error al rotar la matriz',
        ),
      );
    }
  }

  void rotateLeftTest() {
    final matrix = state.input
        .replaceAll(RegExp(r'\s+'), '')
        .substring(2, state.input.length - 2)
        .split('],[')
        .map((e) => e.split(',').map(int.parse).toList())
        .toList();

    final rotatedMatrix = List.generate(
      matrix[0].length,
      (i) => List.generate(
        matrix.length,
        (j) => matrix[j][matrix[j].length - i - 1],
      ),
    );

    emit(state.copyWith(matrix: rotatedMatrix));
  }

  void rotateRightTest() {
    final matrix = state.input
        .replaceAll(RegExp(r'\s+'), '')
        .substring(2, state.input.length - 2)
        .split('],[')
        .map((e) => e.split(',').map(int.parse).toList())
        .toList();

    final rotatedMatrix = List.generate(
      matrix[0].length,
      (i) => List.generate(
        matrix.length,
        (j) => matrix[matrix.length - j - 1][i],
      ),
    );

    emit(state.copyWith(matrix: rotatedMatrix));
  }
}
