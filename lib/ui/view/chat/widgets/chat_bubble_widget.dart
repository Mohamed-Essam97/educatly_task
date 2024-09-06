import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String timestamp;

  const ChatBubble(
      {super.key,
      required this.text,
      required this.isMe,
      required this.timestamp});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('hh:mm a').format(
      DateFormat('HH:mm d/M/yyyy').parse(timestamp),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            BubbleSpecialThree(
              text: text,
              color: isMe ? UIColor.kReciver : UIColor.kSender,
              tail: true,
              isSender: isMe,
              sent: isMe,
              textStyle: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
                height: 4), // Space between the bubble and the timestamp
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
