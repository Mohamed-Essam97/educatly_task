import 'dart:ui';

import 'package:educatly/ui/themes/ui_color.dart';
import 'package:educatly/ui/view/chat/widgets/user_status/user_status_widget.dart';
import 'package:flutter/material.dart';

class ChatScreenAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  ChatScreenAppbarWidget({super.key, required this.userId});

  String userId;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text("Essam"),
          UserStatusWidget(userId: userId),
        ],
      ),
      leading: const BackButton(
        color: UIColor.kBlue, // Replace UIColor.kBlue with your color
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                'https://www.tu-ilmenau.de/unionline/fileadmin/_processed_/0/0/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent, // Transparent background
      elevation: 0, // No shadow
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 20.0, sigmaY: 20.0), // Adjust blur strength
          child: Container(
            color: Colors.black.withOpacity(0.2), // Semi-transparent overlay
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Adjust height if needed
}
