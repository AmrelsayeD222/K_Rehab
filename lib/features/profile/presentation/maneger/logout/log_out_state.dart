part of 'log_out_cubit.dart';

abstract class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

class LogOutInitial extends LogOutState {}

class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {}

class LogOutFailure extends LogOutState {
  final String errorMessage;

  const LogOutFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
