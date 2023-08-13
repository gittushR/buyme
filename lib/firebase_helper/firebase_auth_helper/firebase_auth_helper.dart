import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipkart_grid_5/constants/constants.dart';
import 'package:flipkart_grid_5/constants/routes.dart';
import 'package:flipkart_grid_5/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      ShowLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      // Routes.instance.pushAndRemoveUntil(const HomeScreen(), context)
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }

  Future<bool> signup(
      String email, String password, BuildContext context) async {
    try {
      ShowLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      // Routes.instance.pushAndRemoveUntil(const HomeScreen(), context)
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }
}
