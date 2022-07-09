import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';

class VerifyEmailVM extends ChangeNotifier {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Future sendVerificationEmail(BuildContext context) async {
    try {
      //! displays that the current user can never be null
      final user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();

      canResendEmail = false;
      await Future.delayed(Duration(seconds: 4));
      canResendEmail = true;
    } catch (error) {
      showdialog(
          context: context,
          text: 'An error occured',
          contentText: error.toString());
    }
    notifyListeners();
  }

  Future checkEmailVerified(Timer? timer) async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified) timer?.cancel();
    notifyListeners();
  }
}
