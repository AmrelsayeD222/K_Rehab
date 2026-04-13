part of 'featured_protocol_cubit.dart';

sealed class FeaturedProtocolState extends Equatable {
  const FeaturedProtocolState();

  @override
  List<Object> get props => [];
}

final class FeaturedProtocolInitial extends FeaturedProtocolState {}

final class FeaturedProtocolLoading extends FeaturedProtocolState {}

final class FeaturedProtocolSuccess extends FeaturedProtocolState {
  final List<FeaturedProtocolModel> protocols;
  const FeaturedProtocolSuccess({required this.protocols});
}

final class FeaturedProtocolFailure extends FeaturedProtocolState {
  final String error;
  const FeaturedProtocolFailure({required this.error});
}
