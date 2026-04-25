part of 'protocol_details_cubit.dart';

abstract class ProtocolDetailsState extends Equatable {
  const ProtocolDetailsState();

  @override
  List<Object> get props => [];
}

class ProtocolDetailsInitial extends ProtocolDetailsState {}

class ProtocolDetailsLoading extends ProtocolDetailsState {}

class ProtocolDetailsSuccess extends ProtocolDetailsState {
  final ProtocolDetailsModel details;
  final int selectedTabIndex;
  const ProtocolDetailsSuccess({
    required this.details,
    this.selectedTabIndex = 0,
  });

  @override
  List<Object> get props => [details, selectedTabIndex];
}

class ProtocolDetailsFailure extends ProtocolDetailsState {
  final String error;
  const ProtocolDetailsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
