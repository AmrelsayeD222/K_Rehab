import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';

part 'protocol_details_state.dart';

class ProtocolDetailsCubit extends Cubit<ProtocolDetailsState> {
  final ProtocolRepo protocolRepo;
  ProtocolDetailsCubit(this.protocolRepo) : super(ProtocolDetailsInitial());

  Future<void> fetchProtocolDetails(String protocolId) async {
    emit(ProtocolDetailsLoading());
    final result = await protocolRepo.fetchProtocolDetails(protocolId);
    result.fold(
      (failure) => emit(ProtocolDetailsFailure(error: failure.errorMessage)),
      (details) => emit(ProtocolDetailsSuccess(details: details, selectedTabIndex: 0)),
    );
  }

  void changeTab(int index) {
    if (state is ProtocolDetailsSuccess) {
      final currentState = state as ProtocolDetailsSuccess;
      emit(ProtocolDetailsSuccess(
        details: currentState.details,
        selectedTabIndex: index,
      ));
    }
  }
}
