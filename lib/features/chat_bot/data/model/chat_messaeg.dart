import 'package:equatable/equatable.dart';
import 'package:gemchat/core/utils/constants/enums.dart';
import 'package:uuid/uuid.dart';

class ChatMessage extends Equatable {
  String id;
  String text;
  DateTime timeStamp;
  MessageRole messageRole;

  ChatMessage({
    required this.text,

    required this.messageRole,
    DateTime? timeStamp,
    String? id,
  }) : timeStamp = timeStamp ?? DateTime.now(),
       id = id ?? const Uuid().v4();

  @override
  List<Object?> get props => [id, text, timeStamp, messageRole];
  ChatMessage copyWith({
    DateTime? timeStamp,
    String? id,
    String? text,
    MessageRole? messageRole,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      timeStamp: timeStamp ?? this.timeStamp,
      messageRole: messageRole ?? this.messageRole,
    );
  }
}
