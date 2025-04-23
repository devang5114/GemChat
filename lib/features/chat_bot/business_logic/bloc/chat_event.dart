part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {}

class SendMessageEvent extends ChatEvent {
  final ChatMessage message;
  SendMessageEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class ReceiveMessageEvent extends ChatEvent {
  final ChatMessage message;
  ReceiveMessageEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class ClearChatEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}
