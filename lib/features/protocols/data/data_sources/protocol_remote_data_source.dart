import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/protocol_model.dart';
import '../models/protocol_details_model.dart';

abstract class ProtocolRemoteDataSource {
  Future<List<ProtocolModel>> fetchProtocols();
  Future<ProtocolDetailsModel> fetchProtocolDetails(String protocolId);
}

class ProtocolRemoteDataSourceImpl implements ProtocolRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProtocolRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<ProtocolModel>> fetchProtocols() async {
    final response = await supabaseClient
        .from('protocols')
        .select(
          'id, title, subtitle, isClinicallyReviewed, image_path, duration, sessions, isFree, is_featured',
        );
    
    return response.map((e) => ProtocolModel.fromJson(e)).toList();
  }

  @override
  Future<ProtocolDetailsModel> fetchProtocolDetails(String protocolId) async {
    final response = await supabaseClient
        .from('protocols')
        .select('details')
        .eq('id', protocolId)
        .single();

    if (response['details'] == null) {
      throw Exception('No details found');
    }

    return ProtocolDetailsModel.fromJson(response['details']);
  }
}
