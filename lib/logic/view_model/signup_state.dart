
import 'package:flutter/cupertino.dart';

@immutable
class SignupState {
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController fullNameController;

  const SignupState(
      {required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.fullNameController});

  //this method allows you update the state
  SignupState copyWith(
      {TextEditingController? emailController,
      TextEditingController? phoneController,
      TextEditingController? passwordController,
      TextEditingController? fullNameController}) {
    return SignupState(
        emailController: emailController ?? this.emailController,
        phoneController: phoneController ?? this.phoneController,
        passwordController: passwordController ?? this.passwordController,
        fullNameController: fullNameController ?? this.fullNameController);
  }
}
