import 'package:educatly/logic/chat/chat_cubit.dart';
import 'package:educatly/logic/chat/chat_state.dart';
import 'package:educatly/ui/services/typing_status_service.dart';
import 'package:educatly/ui/view/chat/widgets/chat_bubble_widget.dart';
import 'package:educatly/ui/view/chat/widgets/chat_screen_app_bar_widget.dart';
import 'package:educatly/ui/view/chat/widgets/message_input_widget.dart';
import 'package:educatly/ui/view/chat/widgets/user_typing/typing_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.userId});

  String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TypingStatusService typingStatusService = TypingStatusService();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: ChatScreenAppbarWidget(
        userId: '1',
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessage != null) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                if (state.messages.isEmpty) {
                  return const Center(child: Text('No messages'));
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    final isMe = message.senderId ==
                        FirebaseAuth.instance.currentUser?.uid;
                    return ChatBubble(
                        text: message.text,
                        isMe: isMe,
                        timestamp: message.formattedTimestamp);
                  },
                );
              },
            ),
          ),
          TypingWidget(typingStatusService: typingStatusService),
          const MessageInput(),
        ],
      ),
    );
  }
}
