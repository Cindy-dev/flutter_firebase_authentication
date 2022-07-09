import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:flutter_firebase_authentication/presentation/helper/navigators.dart';
import 'package:flutter_firebase_authentication/presentation/views/home.dart';
import 'package:flutter_firebase_authentication/presentation/views/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginVM extends ChangeNotifier {
  LoginVM() : super();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<void> signIn(BuildContext context, VoidCallback onSuccess) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        onSuccess.call();
      }
      //The password is invalid or the user does not have a password.
    } on FirebaseException catch (error) {
      print(error);
      return showdialog(
          context: context, text: 'Error', contentText: error.toString());
    }
  }

  Future googleLogin(BuildContext context, VoidCallback onSuccess) async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
    //declaring a variable user and using ! to make sure it can never be null
    final user = FirebaseAuth.instance.currentUser!;
    if (user != null || user.uid != user.uid) {
      fireStore.collection('User').add({
        'id': user.uid,
        'phoneNumber': '',
        'email': user.email,
        'fullName': user.displayName,
      });
      onSuccess.call();
      notifyListeners();
    }
  }

  Future<void> signOut(BuildContext context) async {
    showProgress(context);
    try {
      final user = await auth.signOut();
      navigatePush(context, LoginScreen());
      //The password is invalid or the user does not have a password.
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (error) {
      print(error);
      return showdialog(
          context: context, text: 'Error', contentText: error.toString());
    }
    notifyListeners();
  }
}
