import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app_project/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object we need
  UserDetails? _userFromFirebaseUser(User? user) {
    return user != null ? UserDetails(uid: user.uid) : null;
  }

  Stream<User?> get userc {
    return _auth.authStateChanges();
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
