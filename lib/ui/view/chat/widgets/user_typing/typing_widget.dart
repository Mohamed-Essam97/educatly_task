import 'package:educatly/domain/models/typing_status.dart';
import 'package:educatly/ui/services/typing_status_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TypingWidget extends StatelessWidget {
  const TypingWidget({
    super.key,
    required this.typingStatusService,
  });

  final TypingStatusService typingStatusService;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: StreamBuilder<List<TypingStatus>>(
          stream: typingStatusService.getTypingStatusStream('1'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (snapshot.hasData) {
              final typingUsers =
                  snapshot.data!.where((status) => status.isTyping).toList();

              final typingUserIds =
                  typingUsers.map((status) => status.userId).toList();

              final isNotEmpty = typingUserIds.isNotEmpty;

              final isMe = typingUserIds
                  .contains(FirebaseAuth.instance.currentUser!.uid);

              return Visibility(
                  visible: isNotEmpty && !isMe,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Typing ..."),
                  ));
            }
            return const SizedBox();
          }),
    );
  }
}
