import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';

class ForgetPasswordVM extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  Future resetPassword(BuildContext context) async {
    showProgress(context);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      showdialog(
          context: context,
          text: 'Message sent',
          contentText: 'A password reset email was sent to the email provided');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (error) {
      showdialog(
          context: context,
          text: 'An error occurred',
          contentText: error.toString());
    }
  }
}
