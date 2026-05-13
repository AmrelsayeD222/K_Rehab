import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';

abstract class ProtocolLocalDataSource {
  Future<void> cacheProtocols(List<ProtocolModel> protocols);
  Future<List<ProtocolModel>> getCachedProtocols();
  Future<void> cacheProtocolDetails(String id, ProtocolDetailsModel details);
  Future<ProtocolDetailsModel?> getCachedProtocolDetails(String id);
}

class ProtocolLocalDataSourceImpl implements ProtocolLocalDataSource {
  final Box box = Hive.box(HiveManager.protocolsBox);

  @override
  Future<void> cacheProtocols(List<ProtocolModel> protocols) async {
    await box.put('all_protocols', protocols);
  }

  @override
  Future<List<ProtocolModel>> getCachedProtocols() async {
    final List<dynamic>? protocols = box.get('all_protocols');
    if (protocols != null) {
      return protocols.cast<ProtocolModel>();
    }
    return [];
  }

  @override
  Future<void> cacheProtocolDetails(String id, ProtocolDetailsModel details) async {
    await box.put('details_$id', details);
  }

  @override
  Future<ProtocolDetailsModel?> getCachedProtocolDetails(String id) async {
    return box.get('details_$id');
  }
}
