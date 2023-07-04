import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_box/services/login_status.dart';
import '../widgets/snackbar.dart';

class Authentication {

  static Future<bool> signInWithGoogle(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount;

      try {
        googleSignInAccount = await googleSignIn.signIn();
      } on PlatformException catch (e) {
        showSnackBar(context, e.toString(), Colors.redAccent);
        return false;
      }

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if(context.mounted){
            showSnackBar(context, e.toString(), Colors.redAccent);
          }
        } catch (e) {
          if(context.mounted){
            showSnackBar(context, e.toString(), Colors.redAccent);
          }
        }
      }
    }

    if (user != null) {
      setLoginTrue();
      return true;
    }
    return false;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      setLoginFalse();
      Get.toNamed('login-screen');
    } catch (e) {
      showSnackBar(context, 'Error signing out. Try again.', Colors.redAccent);
    }
  }

}