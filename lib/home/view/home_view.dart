import 'package:delosi_test/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rotación de Matriz',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: state.formKey,
              child: Column(
                children: [
                  const MatrixInputHome(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RotateButtonHome(
                        title: 'Rotar izquierda',
                        onPressed: context.read<HomeCubit>().rotateLeft,
                      ),
                      RotateButtonHome(
                        title: 'Rotar derecha',
                        onPressed: context.read<HomeCubit>().rotateRight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const MatrixOutputHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MatrixInputHome extends StatelessWidget {
  const MatrixInputHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Número de operación',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: '[[1,2,3],[4,5,6],[7,8,9]]',
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
            ),
            onChanged: context.read<HomeCubit>().onInputChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese la matriz';
              }
              final regExp = RegExp(
                r'^\[\s*\[\s*\d+(,\s*\d+)*\s*\](\s*,\s*\[\s*\d+(,\s*\d+)*\s*\])*\s*\]$',
              );
              if (!regExp.hasMatch(value)) {
                return 'Por favor, ingrese una matriz válida';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

class RotateButtonHome extends StatelessWidget {
  const RotateButtonHome({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: state.processStatus.isLoading ? null : onPressed,
        child: Text(
          state.processStatus.isLoading ? 'Procesando...' : title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MatrixOutputHome extends StatelessWidget {
  const MatrixOutputHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      key: const Key('matrix_output'),
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _buildChild(context, state),
        );
      },
    );
  }

  Widget _buildChild(BuildContext context, HomeState state) {
    if (state.processStatus.isInitial) {
      return const Center(
        child: Text('Ingrese una matriz para comenzar'),
      );
    } else if (state.processStatus.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
    } else if (state.processStatus.isFailure) {
      return const Center(
        child: Text(
          'Se produjo un error al procesar la matriz',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: state.matrix.map((row) {
              return Row(
                children: row.map((int value) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Center(child: Text('$value')),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
