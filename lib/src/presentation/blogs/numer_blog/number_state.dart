import 'package:equatable/equatable.dart';

abstract class NumberState extends Equatable {
  const NumberState();

  @override
  List<Object?> get props => [];
}

class NumberInitial extends NumberState {}

class NumberLoaded extends NumberState {
  final List<int> numbers;

  NumberLoaded(this.numbers);

  @override
  List<Object?> get props => [numbers];
}

class NumberError extends NumberState {
  final String message;

  NumberError(this.message);

  @override
  List<Object?> get props => [message];
}
