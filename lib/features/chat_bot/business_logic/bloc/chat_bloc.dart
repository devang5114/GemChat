import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemchat/core/utils/constants/enums.dart';
import 'package:gemchat/features/chat_bot/data/model/chat_messaeg.dart';
import 'package:gemchat/features/chat_bot/data/repository/chat_bot_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBotRepository chatBotRepository;

  ChatBloc(this.chatBotRepository) : super(ChatState.initial()) {
    on<ChatEvent>((event, emit) {});
    on<SendMessageEvent>(onSendMessageEvent);
    on<ReceiveMessageEvent>(onReceiveMessageEvent);
    on<ClearChatEvent>(onClearChatEvent);
  }

  onSendMessageEvent(SendMessageEvent event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          chatState: ChatStatus.loading,
          messages: [...state.messages, event.message],
        ),
      );

      final chatResponse = await chatBotRepository.getChatBotResponse(
        event.message,
      );
      add(
        ReceiveMessageEvent(
          ChatMessage(text: chatResponse, messageRole: MessageRole.assistant),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          chatState: ChatStatus.error,
          messages: [...state.messages, event.message],
        ),
      );
    }
  }

  onReceiveMessageEvent(ReceiveMessageEvent event, Emitter emit) {
    try {
      emit(
        state.copyWith(
          chatState: ChatStatus.loading,
          messages: [...state.messages, event.message],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          chatState: ChatStatus.error,
          messages: [...state.messages, event.message],
        ),
      );
    }
  }

  onClearChatEvent(ClearChatEvent event, Emitter emit) {
    emit(ChatState.initial());
  }
}
