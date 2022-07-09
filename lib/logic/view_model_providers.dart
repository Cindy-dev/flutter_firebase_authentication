import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_authentication/logic/view_model/forget_password_vm.dart';
import 'package:flutter_firebase_authentication/logic/view_model/home_vm.dart';
import 'package:flutter_firebase_authentication/logic/view_model/login_vm.dart';
import 'package:flutter_firebase_authentication/logic/view_model/signup_vm.dart';
import 'package:flutter_firebase_authentication/logic/view_model/verify_email_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginVM = ChangeNotifierProvider((_) => LoginVM());
final signUpVM = ChangeNotifierProvider((_) => SignUpVM());
final forgotpassVM = ChangeNotifierProvider((_) => ForgetPasswordVM());
final homeVM = ChangeNotifierProvider((_) => HomeViewModel());
final verifyEmailVM = ChangeNotifierProvider((_) => VerifyEmailVM());