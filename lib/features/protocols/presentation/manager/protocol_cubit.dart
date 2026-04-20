import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';

part 'protocol_state.dart';

class ProtocolCubit extends Cubit<ProtocolState> {
  final ProtocolRepo protocolRepo;

  ProtocolCubit(this.protocolRepo) : super(ProtocolInitial());

  Future<void> fetchProtocols() async {
    if (isClosed) return;
    emit(ProtocolLoading());
    final result = await protocolRepo.fetchProtocols();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ProtocolFailure(error: failure.errorMessage)),
      (protocols) => emit(ProtocolSuccess(protocols: protocols)),
    );
  }
}
