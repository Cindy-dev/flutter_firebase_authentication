import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logic/view_model_providers.dart';
import '../helper/custom_shape.dart';
import '../helper/navigators.dart';
import '../helper/text_form.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(loginVM);
    final readViewModel = ref.read(loginVM);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
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
                    padding: EdgeInsets.only(bottom: 68),
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
                  InkWell(
                    onTap: ()=>readViewModel.signIn(context),
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
                      child: const Text('Login'),
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
