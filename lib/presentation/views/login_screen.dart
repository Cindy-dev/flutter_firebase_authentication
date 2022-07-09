import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:flutter_firebase_authentication/presentation/views/forget_password.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logic/view_model_providers.dart';
import '../helper/custom_shape.dart';
import '../helper/navigators.dart';
import '../helper/text_form.dart';
import 'home.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(loginVM);
    final readViewModel = ref.read(loginVM.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: _loginformKey,
          child: Stack(
            children: [
              Positioned(
                bottom: 0.5,
                left: 50,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account yet?'),
                    const SizedBox(width: 5),
                    InkWell(
                        onTap: () =>
                            navigatePush(context, const SignUpScreen()),
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
              CustomPaint(
                size: const Size(527, 590),
                painter: CustomShapePainter(),
              ),
              Column(
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 68, top: 50),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xffF5F5F5),
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  buildForm(
                      controller: readViewModel.emailController,
                      obscure: false,
                      hintText: 'Please input your Email',
                      labelText: 'Email',
                      context, validator: (val) {
                    if (val!.isEmpty) {
                      return 'This Field Is Required';
                    } else if (!val.contains('@')) {
                      return 'Please input a valid Email';
                    }
                  }),
                  buildForm(
                      controller: readViewModel.passwordController,
                      obscure: false,
                      hintText: 'Please input an 8 digit Password',
                      labelText: 'Password',
                      context, validator: (val) {
                    if (val!.length < 8) {
                      return ('password is too short');
                    }
                  }),
                  GestureDetector(
                    onTap: () => readViewModel.signIn(context, () {
                      if (!mounted) return;
                      navigatePush(context, const HomeScreen());
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      height: context.height() * .07,
                      margin: const EdgeInsets.only(
                          bottom: 19, left: 52, right: 52, top: 68),
                      width: context.width() * 3,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(48, 91, 241, 0.79),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatePush(context, const ForgetPassword());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: Text(
                        'Forgot your password ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            height: 2,
                            indent: 20,
                            endIndent: 20,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          'connect with',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          height: 2,
                          indent: 20,
                          endIndent: 20,
                          thickness: 2,
                        )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => readViewModel.googleLogin(context, () {
                      if (!mounted) return;
                      navigatePush(context, const HomeScreen());
                    }),
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 29),
                        height: context.height() * .06,
                        width: context.height() * .3,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.25),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Google',
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
