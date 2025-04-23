import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:gemchat/core/utils/constants/enums.dart';
import 'package:gemchat/features/chat_bot/data/model/chat_messaeg.dart';

class FirebaseVertaxAiProvider {
  final FirebaseVertexAI _firebaseVertexAI;

  FirebaseVertaxAiProvider(this._firebaseVertexAI);

  Future<String> generateResponse(List<ChatMessage> messages) async {
    try {
      final content = messages.map(
        (message) => Content(
          message.messageRole == MessageRole.user ? "user" : "model",
          [TextPart(message.text)],
        ),
      );
      final response = await _firebaseVertexAI
          .generativeModel(model: 'gpt-3.5-turbo')
          .generateContent(content);
      return response.text ?? "";
    } catch (e) {
      return "En Error Occured: $e";
    }
  }
}
