import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemchat/features/chat_bot/business_logic/bloc/chat_bloc.dart';
import 'package:gemchat/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:gemchat/features/chat_bot/presentation/widgets/message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gem Chat 💎'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.read<ChatBloc>().add(ClearChatEvent());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: 50,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = state.messages.reversed.toList()[index];
                    return ChatBubble(message: message);
                  },
                );
              },
            ),
          ),
          ChatMessaegInput(),
        ],
      ),
    );
  }
}
