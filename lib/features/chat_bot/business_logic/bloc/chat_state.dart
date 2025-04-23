part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final ChatStatus chatState;

  const ChatState({required this.messages, required this.chatState});

  const ChatState.initial()
    : this(messages: const [], chatState: ChatStatus.idle);

  ChatState copyWith({List<ChatMessage>? messages, ChatStatus? chatState}) {
    return ChatState(
      messages: messages ?? this.messages,
      chatState: chatState ?? this.chatState,
    );
  }

  @override
  List<Object?> get props => [messages, chatState];
}
