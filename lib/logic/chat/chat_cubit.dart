import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educatly/domain/models/message_model.dart';
import 'package:educatly/logic/chat/chat_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String curruntUserId = FirebaseAuth.instance.currentUser!.uid;

  ChatCubit() : super(const ChatState()) {
    _initialize();
  }

  String generateChatId() {
    final ids = ['1', '2'];
    ids.sort();
    return ids.join('_');
  }

  Future<void> _initialize() async {
    final String chatId = generateChatId();

    emit(state.copyWith(isLoading: true));
    try {
      _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        final messages =
            snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList();
        emit(state.copyWith(messages: messages, isLoading: false));
      });
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> sendMessage(String text, String senderId) async {
    final String chatId = generateChatId();

    final message = {
      'text': text,
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(message);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> typing(bool isTyping, String userId) async {
    final String chatId = generateChatId();

    final typingStatus = {
      'userId': userId,
      'isTyping': isTyping,
      'timestamp': FieldValue.serverTimestamp(),
    };
    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('typing')
          .doc(userId)
          .set(typingStatus);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
