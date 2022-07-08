import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:flutter_firebase_authentication/presentation/helper/navigators.dart';
import 'package:flutter_firebase_authentication/presentation/views/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginVM extends ChangeNotifier {
  LoginVM() : super();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<void> signIn(BuildContext context) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        navigatePush(context, const HomeScreen());
      }
      //The password is invalid or the user does not have a password.
    } catch (error) {
      print(error);
      if (error is PlatformException) {
        if (error.code == 'ERROR_USER_NOT_FOUND') {
          return showdialog(
              context: context,
              text: 'Error',
              contentText: 'Email does not exist');
        } else if (error.code == 'The password is invalid or the user does not have a password.') {
          return showdialog(
              context: context,
              text: 'Error',
              contentText: 'Incorrect email or password');
        } else if (error.code == 'ERROR_NETWORK_REQUEST_FAILED') {
          return showdialog(
              context: context,
              text: 'Error',
              contentText: 'Please check your internet connection');
        }
       }
        else {
        return showdialog(
            context: context,
            text: 'Error',
            contentText: error.toString());
      }
    }
  }
}
