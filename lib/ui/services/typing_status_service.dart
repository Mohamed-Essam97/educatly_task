import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educatly/domain/models/typing_status.dart';

class TypingStatusService {
  TypingStatusService();

  Stream<List<TypingStatus>> getTypingStatusStream(String chatId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('typing')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TypingStatus.fromFirestore(doc))
            .toList());
  }
}
