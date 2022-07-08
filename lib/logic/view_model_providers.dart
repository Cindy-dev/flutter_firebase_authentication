import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_authentication/logic/view_model/login_vm.dart';
import 'package:flutter_firebase_authentication/logic/view_model/signup_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

 final loginVM = ChangeNotifierProvider((_)=>LoginVM());
 final signUpVM = ChangeNotifierProvider((_)=>SignUpVM());
