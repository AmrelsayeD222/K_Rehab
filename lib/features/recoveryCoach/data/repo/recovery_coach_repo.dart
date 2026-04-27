import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import '../models/chat_message_model.dart';

abstract class RecoveryCoachRepo {
  Future<Either<Failure, String>> sendMessage(
    List<ChatMessageModel> messages,
  );
}
