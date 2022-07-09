import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/logic/view_model_providers.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              ref.watch(loginVM).signOut(
                    context,
                  );
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
                'Log Out',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
