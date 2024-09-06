import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educatly/logic/auth/auth_state.dart';
import 'package:educatly/ui/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> createUser({String? userId, String? name, String? email}) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': name,
        'email': email,
      });
    } catch (e) {
      print('Failed to create user: $e');
    }
  }

  Future<void> signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    emit(state.copyWith(isSignUpLoadin: true, errorMessage: null));
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) async {
        await _storage.write(key: 'user_email', value: user.user!.email);
        await _storage.write(key: 'user_uid', value: user.user!.uid);
        await createUser(userId: user.user!.uid, email: email, name: name);
        emit(
          state.copyWith(
            user: user,
            isSignUpLoadin: false,
            isLoggingIn: true,
            isLoggedIn: true,
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      NotificationService.showToast(e.message ?? "An unknown error occurred");
      emit(state.copyWith(isSignUpLoadin: false, errorMessage: e.message));
    } catch (e) {
      NotificationService.showToast("An unknown error occurred");
      emit(state.copyWith(
          isSignUpLoadin: false, errorMessage: "An unknown error occurred"));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(state.copyWith(isLoggingIn: true, errorMessage: null));
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await _storage.write(key: 'user_email', value: user.user!.email);
        await _storage.write(key: 'user_uid', value: user.user!.uid);
        emit(
          state.copyWith(
            isLoggingIn: false,
            isLoggedIn: true,
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      NotificationService.showToast(e.message ?? "An unknown error occurred");
      emit(state.copyWith(isLoggingIn: false, errorMessage: e.message));
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _storage.delete(key: 'user_email');
    emit(state.copyWith(isLoggedIn: false));
  }
}
