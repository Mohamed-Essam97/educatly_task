import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educatly/ui/services/user_status_service.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';

class UserStatusWidget extends StatelessWidget {
  UserStatusWidget({
    super.key,
    required this.userId,
  });
  String userId;

  @override
  Widget build(BuildContext context) {
    final UserStatusService userStatusService =
        UserStatusService(userId: userId);

    return StreamBuilder<DocumentSnapshot>(
      stream: userStatusService.getUserStatusStream(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (snapshot.hasData) {
          // final data = snapshot.data!.data() as Map<String, dynamic>;
          final isOnline = snapshot.data!['online'] ?? false;

          return Text(
            isOnline ? 'Online' : 'Offline',
            style: const TextStyle(color: UIColor.kGray),
          );
        }

        return const Text(
          'Status unknown',
          style: TextStyle(
            color: UIColor.kGray,
          ),
        );
      },
    );
  }
}
