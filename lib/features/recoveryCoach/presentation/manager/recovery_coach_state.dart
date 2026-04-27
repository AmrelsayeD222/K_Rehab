part of 'recovery_coach_cubit.dart';

abstract class RecoveryCoachState extends Equatable {
  const RecoveryCoachState();

  @override
  List<Object> get props => [];
}

class RecoveryCoachInitial extends RecoveryCoachState {}

class RecoveryCoachLoaded extends RecoveryCoachState {
  final List<ChatMessageModel> messages;
  const RecoveryCoachLoaded({required this.messages});

  @override
  List<Object> get props => [messages];
}

class RecoveryCoachError extends RecoveryCoachState {
  final List<ChatMessageModel> messages;
  final String error;
  const RecoveryCoachError({required this.messages, required this.error});

  @override
  List<Object> get props => [messages, error];
}
