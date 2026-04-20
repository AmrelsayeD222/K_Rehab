part of 'protocol_cubit.dart';

sealed class ProtocolState extends Equatable {
  const ProtocolState();

  @override
  List<Object> get props => [];
}

final class ProtocolInitial extends ProtocolState {}

final class ProtocolLoading extends ProtocolState {}

final class ProtocolSuccess extends ProtocolState {
  final List<ProtocolModel> protocols;
  const ProtocolSuccess({required this.protocols});

  @override
  List<Object> get props => [protocols];
}

final class ProtocolFailure extends ProtocolState {
  final String error;
  const ProtocolFailure({required this.error});

  @override
  List<Object> get props => [error];
}
