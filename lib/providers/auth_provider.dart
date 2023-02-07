import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:pokemony/features/home/home_page.dart';

import '../core/common/common_widget.dart';

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});

class Authentication {
  // For Authentication related functions you need an instance of FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => auth.authStateChanges();

  // Now This Class Contains 3 Functions currently
  // 1. signInwithEmailAndPassword
  // 2. signUpWithEmailAndPassword
  // 3. signOut

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        // save the current user
        Get.offAll(() => const HomePage());
      }
    } on FirebaseAuthException catch (e) {
      await CommonWidgets().showAlertDialog(
        context: context,
        title: 'Error Occured',
        content: e.toString(),
      );
    } catch (e) {
      if (e == 'email-already-in-use') {
        await CommonWidgets().showAlertDialog(
          context: context,
          title: 'Error Occured',
          content: 'Email already in use.',
        );
      } else {
        await CommonWidgets().showAlertDialog(
          context: context,
          title: 'Error Occured',
          content: e.toString(),
        );
      }
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await auth.signOut();
  }
}
