import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<User?> signInWithEmailAndPassword(
      {required String email, password}) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      print('erro em Firebase Auth: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

//
