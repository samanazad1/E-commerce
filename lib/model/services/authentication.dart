import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance.collection('userData');

  Future<void> createAccount(
      String userName, String email, String password, String userID) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _store.add({
        'userID': userID,
        'name': userName,
        'email': email,
        // Do not store the password in Firestore for security reasons
        // 'password': password,
      });
    } catch (e) {
      // Handle any errors that occur during account creation here

      rethrow; // You can rethrow the exception or handle it as needed
    }
  }

  Future<void> loginToAccount(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      //
    }
  }

  Future<void> loginAnonymously() async {
    try {
      _auth.signInAnonymously();
    } on FirebaseAuthException {
      //
      //
    }
  }
}
