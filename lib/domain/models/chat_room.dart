import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String id;
  final List<String> participants;
  final Timestamp createdAt;

  ChatRoom({
    required this.id,
    required this.participants,
    required this.createdAt,
  });

  factory ChatRoom.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChatRoom(
      id: doc.id,
      participants: List<String>.from(data['participants'] ?? []),
      createdAt: data['createdAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants,
      'createdAt': createdAt,
    };
  }
}
