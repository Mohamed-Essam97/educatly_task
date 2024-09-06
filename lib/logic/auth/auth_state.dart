import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String expiresOn;
  final bool isLoggingIn;
  final bool isLoggedIn;
  final bool isSignUpLoadin;
  final String errorMessage;
  final bool hasError;
  final UserCredential? user;

  const AuthState({
    this.user,
    this.accessToken = '',
    this.refreshToken = '',
    this.expiresOn = '',
    this.isLoggingIn = false,
    this.isLoggedIn = false,
    this.hasError = false,
    this.isSignUpLoadin = false,
    this.errorMessage = '',
  });

  AuthState copyWith({
    UserCredential? user,
    String? accessToken,
    String? refreshToken,
    String? expiresOn,
    bool? isLoggingIn,
    bool? isLoggedIn,
    bool? isSignUpLoadin,
    bool? hasError,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresOn: expiresOn ?? this.expiresOn,
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isSignUpLoadin: isSignUpLoadin ?? this.isSignUpLoadin,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
        expiresOn,
        isLoggingIn,
        errorMessage,
        isLoggedIn,
        isSignUpLoadin,
        hasError,
      ];
}
