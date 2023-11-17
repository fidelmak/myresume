import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error during registration: $e');
  }
}

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error during login: $e');
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  // User signed out
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}
