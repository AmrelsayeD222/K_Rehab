import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/home/data/repo/home_repo.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';

part 'featured_protocol_state.dart';

class FeaturedProtocolCubit extends Cubit<FeaturedProtocolState> {
  final HomeRepo homeRepo;
  FeaturedProtocolCubit(this.homeRepo) : super(FeaturedProtocolInitial());

  Future<void> getFeaturedProtocols() async {
    emit(FeaturedProtocolLoading());
    final result = await homeRepo.getFeaturedProtocols();
    result.fold(
      (failure) => emit(FeaturedProtocolFailure(failure.errorMessage)),
      (protocols) => emit(FeaturedProtocolSuccess(protocols)),
    );
  }
}
