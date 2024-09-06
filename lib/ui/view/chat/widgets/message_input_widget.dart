import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:educatly/logic/chat/chat_cubit.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      messageBarColor: UIColor.kPrimary,
      sendButtonColor: UIColor.kBlue,
      replying: false,
      onTextChanged: (s) {
        context
            .read<ChatCubit>()
            .typing(true, FirebaseAuth.instance.currentUser!.uid);
      },
      onSend: (message) {
        BlocProvider.of<ChatCubit>(context)
            .sendMessage(message, FirebaseAuth.instance.currentUser!.uid);
        context
            .read<ChatCubit>()
            .typing(false, FirebaseAuth.instance.currentUser!.uid);
      },
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: const Icon(
              Icons.attach_file_rounded,
              color: UIColor.kSecondry,
              size: 24,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
