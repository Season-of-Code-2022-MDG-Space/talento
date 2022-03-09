import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app_project/models/user.dart';
import 'package:test_app_project/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object we need
  UserDetails? _userFromFirebaseUser(User? user) {
    return user != null ? UserDetails(uid: user.uid) : null;
  }

  Stream<UserDetails?> get userc {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future regWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DataBaseService(uid: user!.uid).updateUserData();

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
