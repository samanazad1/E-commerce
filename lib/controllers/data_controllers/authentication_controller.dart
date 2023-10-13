import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece/model/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoginScreen = false;
  bool isLoading = false;

  void changeState() {
    isLoginScreen = !isLoginScreen;
    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance.collection('userData');
  User? _user;
  User? get user => _user;

  String? _userName;
  String? get userName => _userName;
  bool get isUser => user != null;
  AuthController() {
    // Initialize the user and username when the AuthController is created.
    _user = _auth.currentUser;
    if (_user != null) {}
  }

  Future<void> createAccount(
    String userName,
    String email,
    String password,
  ) async {
    try {
      isLoading = true;
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;

      if (_user != null) {
        // Use the user's UID, which is immediately available after account creation
        await _store.doc(_auth.currentUser!.uid).set({
          'userID': _auth.currentUser!.uid,
          'name': userName,
          'email': email,
        });
      }

      isLoading = false;
    } catch (e) {
      // Handle any errors that occur during account creation here
      rethrow; // You can rethrow the exception or handle it as needed
    }
  }

  Future<void> loginToAccount(String email, String password) async {
    isLoading = true;
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      isLoading = false;
    } on FirebaseAuthException {
      // Handle authentication errors here
    }
  }

  Future<void> loginAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      _user = userCredential.user;
    } on FirebaseAuthException {
      // Handle authentication errors here
    }
  }

  void logout() {
    _auth.signOut();
  }

  

  getData() async {}
}
