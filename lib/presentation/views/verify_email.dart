import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/logic/view_model_providers.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:flutter_firebase_authentication/presentation/views/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helper/custom_shape.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//there must be a current user because its only then we can call email verified
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      ref.read(verifyEmailVM).sendVerificationEmail(context);
      timer = Timer.periodic(Duration(seconds: 3),
          (_) => ref.read(verifyEmailVM).checkEmailVerified(timer));
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomeScreen()
      : Scaffold(
          body: Stack(
            children: [
              CustomPaint(
                size: const Size(527, 700),
                painter: CustomShapePainter(),
              ),
              const Spacer(),
              Column(
                children: [
                  const Spacer(),
                  const Text(
                    'A verification email has been sent to your email address',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      final viewModel = ref.watch(verifyEmailVM);

                      viewModel.canResendEmail
                          ? viewModel.sendVerificationEmail(context)
                          : null;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: context.height() * .08,
                      margin: const EdgeInsets.only(top: 18,left: 20, right: 20),
                      width: context.width() * 3,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(48, 91, 241, 0.79),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Expanded(
                        child: Text(
                          'Not received yet? Resend Email',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final viewModel = ref.watch(loginVM);

                      viewModel.signOut(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: context.height() * .07,
                      margin: const EdgeInsets.only(
                          bottom: 150, left: 52, right: 52, top: 28),
                      width: context.width() * 2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        );
}
