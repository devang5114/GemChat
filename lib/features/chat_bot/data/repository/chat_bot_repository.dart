import 'package:gemchat/features/chat_bot/data/data__provider/firebase_vertax_ai_provider.dart';
import 'package:gemchat/features/chat_bot/data/model/chat_messaeg.dart';

class ChatBotRepository {
  final FirebaseVertaxAiProvider firebaseVertaxAiProvider;
  ChatBotRepository(this.firebaseVertaxAiProvider);

  Future<String> getChatBotResponse(ChatMessage chatMessage) async {
    try {
      return firebaseVertaxAiProvider.generateResponse([chatMessage]);
    } catch (e) {
      return "Error Occured: $e";
    }
  }
}
