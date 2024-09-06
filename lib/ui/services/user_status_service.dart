import 'package:cloud_firestore/cloud_firestore.dart';

class UserStatusService {
  UserStatusService({required this.userId});

  String userId;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Update user status to online
  Future<void> setOnline() async {
    await _firestore.collection('users').doc(userId).set({
      'online': true,
      'lastActive': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  // Update user status to offline
  Future<void> setOffline() async {
    await _firestore.collection('users').doc(userId).set({
      'online': false,
      'lastActive': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getUserStatusStream(String userId) {
    return _firestore.collection('users').doc(userId).snapshots();
  }
}
