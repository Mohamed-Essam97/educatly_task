import 'package:educatly/domain/models/message_model.dart';
import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final List<Message> messages;
  final List<String> typingUsers;
  final bool isLoading;
  final String? errorMessage;
  final bool userOnlineStatus;
  final bool isOnline;

  const ChatState({
    this.messages = const [],
    this.typingUsers = const [],
    this.isLoading = false,
    this.errorMessage,
    this.userOnlineStatus = false,
    this.isOnline = false,
  });

  ChatState copyWith({
    List<Message>? messages,
    List<String>? typingUsers,
    bool? isLoading,
    String? errorMessage,
    bool? userOnlineStatus,
    bool? isOnline,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      typingUsers: typingUsers ?? this.typingUsers,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      userOnlineStatus: userOnlineStatus ?? this.userOnlineStatus,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        typingUsers,
        isLoading,
        errorMessage,
        userOnlineStatus,
        isOnline
      ];
}
