import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemchat/core/utils/constants/enums.dart';
import 'package:gemchat/features/chat_bot/business_logic/bloc/chat_bloc.dart';
import 'package:gemchat/features/chat_bot/data/model/chat_messaeg.dart';

class ChatMessaegInput extends StatefulWidget {
  const ChatMessaegInput({super.key});

  @override
  State<ChatMessaegInput> createState() => _ChatMessaegInputState();
}

class _ChatMessaegInputState extends State<ChatMessaegInput> {
  TextEditingController chatMessageController = TextEditingController();

  ValueNotifier<bool> isReadyToSendNotifier = ValueNotifier(false);

  @override
  void initState() {
    chatMessageController.addListener(() {
      isReadyToSendNotifier.value = chatMessageController.text.isNotEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    isReadyToSendNotifier.dispose();
    chatMessageController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state.chatState == ChatStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('An error occurred while sending the message.'),
              ),
            );
          }
        },
        builder: (context, state) {
          return ValueListenableBuilder(
            valueListenable: isReadyToSendNotifier,

            builder: (context, isReadyToSend, _) {
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatMessageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (isReadyToSend)
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        context.read<ChatBloc>().add(
                          SendMessageEvent(
                            ChatMessage(
                              text: chatMessageController.text,
                              messageRole: MessageRole.user,
                            ),
                          ),
                        );
                      },
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
