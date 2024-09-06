import 'package:cloud_firestore/cloud_firestore.dart';

class TypingStatus {
  final String userId;
  final bool isTyping;
  final Timestamp timestamp;

  TypingStatus({
    required this.userId,
    required this.isTyping,
    required this.timestamp,
  });

  factory TypingStatus.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TypingStatus(
      userId: data['userId'] as String,
      isTyping: data['isTyping'] as bool,
      timestamp: data['timestamp'] as Timestamp,
    );
  }
}
