import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:k_rehab/core/error/dio_failure.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/services/api_service.dart';
import '../models/chat_message_model.dart';
import 'recovery_coach_repo.dart';

class RecoveryCoachRepoImpl implements RecoveryCoachRepo {
  final ApiService apiService;

  static const String _systemPrompt =
      'You are a physiotherapy AI coach for the K-Rehab app. '
      'Only answer questions related to physical therapy, '
      'rehabilitation exercises, recovery protocols, and injury prevention. '
      'Keep responses concise, supportive, and practical. '
      'Respond in the same language as the user.';

  RecoveryCoachRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, String>> sendMessage(
    List<ChatMessageModel> messages,
  ) async {
    try {
      final contents = messages
          .where((m) => !m.isTyping)
          .map(
            (m) => {
              'role': m.isUser ? 'user' : 'model',
              'parts': [
                {'text': m.content},
              ],
            },
          )
          .toList();

      final data = await apiService.post(
        endpoint: '/gemini-2.5-flash:generateContent',
        body: {
          'system_instruction': {
            'parts': [
              {'text': _systemPrompt},
            ],
          },
          'contents': contents,
        },
      );

      final candidates = data['candidates'] as List<dynamic>?;
      if (candidates == null || candidates.isEmpty) {
        return left(ServerFailure('No response from AI'));
      }

      final candidate = candidates[0] as Map<String, dynamic>;
      final content = candidate['content'] as Map<String, dynamic>?;
      if (content == null) {
        return left(ServerFailure('Response blocked by safety filters'));
      }

      final parts = content['parts'] as List<dynamic>? ?? [];
      if (parts.isEmpty) {
        return left(ServerFailure('Empty AI response'));
      }
      final reply = parts.map((p) => p['text'] as String).join();
      return right(reply.trim());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
