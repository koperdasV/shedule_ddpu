import 'package:firebase_auth/firebase_auth.dart';
import 'package:rozklad_ddpu/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> signInWithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<User> signUpWithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    }
  }

  Future signOut() async {
    await _fAuth.signOut();
  }

  Stream<User> get currentUser {
    return _fAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }
}
