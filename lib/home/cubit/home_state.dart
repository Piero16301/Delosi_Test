part of 'home_cubit.dart';

enum ProcessStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ProcessStatus.initial;
  bool get isLoading => this == ProcessStatus.loading;
  bool get isSuccess => this == ProcessStatus.success;
  bool get isFailure => this == ProcessStatus.failure;
}

class HomeState extends Equatable {
  const HomeState({
    this.processStatus = ProcessStatus.initial,
    this.formKey,
    this.input = '',
    this.matrix = const <List<int>>[],
  });

  final ProcessStatus processStatus;
  final GlobalKey<FormState>? formKey;
  final String input;
  final List<List<int>> matrix;

  HomeState copyWith({
    ProcessStatus? processStatus,
    GlobalKey<FormState>? formKey,
    String? input,
    List<List<int>>? matrix,
  }) {
    return HomeState(
      processStatus: processStatus ?? this.processStatus,
      formKey: formKey ?? this.formKey,
      input: input ?? this.input,
      matrix: matrix ?? this.matrix,
    );
  }

  @override
  List<Object?> get props => [
        processStatus,
        formKey,
        input,
        matrix,
      ];
}
