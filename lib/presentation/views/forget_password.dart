import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/logic/view_model_providers.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:flutter_firebase_authentication/presentation/views/signup_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helper/custom_shape.dart';
import '../helper/navigators.dart';
import '../helper/text_form.dart';
import 'login_screen.dart';

class ForgetPassword extends StatefulHookConsumerWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends ConsumerState<ForgetPassword> {
  GlobalKey<FormState> _forgetpasskey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(forgotpassVM);
    final readviewModel = ref.read(forgotpassVM.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: _forgetpasskey,
          child: Stack(
            children: [
              CustomPaint(
                size: const Size(527, 550),
                painter: CustomShapePainter(),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 30, left: 5),
                    child: IconButton(
                      onPressed: () => navigatePop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Color(0xffF5F5F5),
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  buildForm(
                    controller: readviewModel.emailController,
                    obscure: false,
                    hintText: 'Please input your Email',
                    labelText: 'Email',
                    context,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This Field Is Required';
                      } else if (!val.contains('@')) {
                        return 'Please input a valid Email';
                      }
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        readviewModel.resetPassword(context);
                      },
                    child: Container(
                      alignment: Alignment.center,
                      height: context.height() * .07,
                      margin: const EdgeInsets.only(
                          bottom: 150, left: 52, right: 52, top: 68),
                      width: context.width() * 3,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(48, 91, 241, 0.79),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
