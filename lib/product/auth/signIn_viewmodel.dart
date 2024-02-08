import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../manager/auth_manager.dart';
import 'signInScreen.dart';

abstract class SignInViewmeodel extends State<SignInScreen> {
  AuthManager authManager = AuthManager();

  final _firebase = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  var prefs = SharedPreferences.getInstance();
  String enteredEmail = "";
  String enteredPassword = "";

  Future<void> checkLoggedInUser() async {
    if (await authManager.loggedIn()) {
      // User is already logged in, navigate to home screen
      context.go('/home');
    }
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      try {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);

        // Save login state to local storage
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('loggedIn', true);

        context.go('/home');
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Authentication Failed.")));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoggedInUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
