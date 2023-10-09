import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance.collection('userData');
  void createAccount(
      String userName, String email, String password, String userID) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _store.add({
      'userID': userID,
      'name': userName,
      'email': email,
      'password': password,
    });
  }
}
