import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/logic/view_model/signup_vm.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../logic/view_model_providers.dart';
import '../helper/custom_shape.dart';
import '../helper/navigators.dart';
import '../helper/text_form.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  GlobalKey<FormState> _signupformKey = GlobalKey<FormState>();
  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = ref.watch(signUpVM);
    final readViewModel = ref.read(signUpVM);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: _signupformKey,
          child: Stack(
            children: [
              Positioned(
                bottom: 0.5,
                left: 50,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(width: 5),
                    InkWell(
                        onTap: () => navigatePush(context, const LoginScreen()),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
              CustomPaint(
                size: const Size(527, 700),
                painter: CustomShapePainter(),
              ),
              Column(
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 35, top: 30),
                    child: Text(
                      'Signup',
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
                    context,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This Field Is Required';
                      } else if (!val.contains('@')) {
                        return 'Please input a valid Email';
                      }
                    },
                  ),
                  buildForm(
                      controller: readViewModel.fullNameController,
                      obscure: false,
                      hintText: 'Please input your Full Name',
                      labelText: 'Full Name',
                      context, validator: (val) {
                    if (val!.isEmpty) {
                      return 'This Field Is Required';
                    }
                  }),
                  buildForm(
                      controller: readViewModel.phoneController,
                      obscure: false,
                      hintText: 'Please input your Phone Number',
                      labelText: 'Phone Number',
                      context, validator: (val) {
                    if (val!.isEmpty) {
                      return 'This Field Is Required';
                    } else if (val.length < 11) {
                      return 'Your phone number shouldnt be less than 11 digits';
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
                    onTap: () {
                      readViewModel.signUP(context);
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
                        'Signup',
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
