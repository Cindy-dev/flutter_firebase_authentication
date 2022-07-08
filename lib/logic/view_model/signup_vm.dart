//library 'signup_vm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_authentication/presentation/helper/navigators.dart';
import 'package:flutter_firebase_authentication/presentation/views/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpVM extends ChangeNotifier {
  SignUpVM() : super();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<void> signUP(BuildContext context) async {
    try {
      final newUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      if (newUser != null) {
        fireStore.collection('User').add({
          'id': newUser.user?.uid,
          'phoneNumber': phoneController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'fullName': fullNameController.text,
        });
        print(emailController);
        navigatePush(context, const LoginScreen());
      }
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }
}
