import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String text;
  final String senderId;
  final Timestamp timestamp;

  const Message({
    required this.text,
    required this.senderId,
    required this.timestamp,
  });

  factory Message.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(
      text: data['text'] ?? '',
      senderId: data['senderId'] ?? '',
      timestamp: data['timestamp'] as Timestamp? ??
          Timestamp.now(), // Handle null case
    );
  }

  String get formattedTimestamp {
    final date = timestamp.toDate();
    return '${date.hour}:${date.minute} ${date.day}/${date.month}/${date.year}';
  }

  @override
  List<Object?> get props => [text, senderId, timestamp];
}
