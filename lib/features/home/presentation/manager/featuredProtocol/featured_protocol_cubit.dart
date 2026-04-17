import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/home/data/models/featured_protocol_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_protocol_repo.dart';

part 'featured_protocol_state.dart';

class FeaturedProtocolCubit extends Cubit<FeaturedProtocolState> {
  final FeaturedProtocolRepo featuredProtocolRepo;
  FeaturedProtocolCubit(this.featuredProtocolRepo)
    : super(FeaturedProtocolInitial());

  Future<void> getFeaturedProtocols() async {
    if (isClosed) return;
    emit(FeaturedProtocolLoading());
    final result = await featuredProtocolRepo.getFeaturedProtocols();
    if (isClosed) return;
    result.fold(
      (failure) => emit(FeaturedProtocolFailure(error: failure.errorMessage)),
      (protocols) => emit(FeaturedProtocolSuccess(protocols: protocols)),
    );
  }
}
