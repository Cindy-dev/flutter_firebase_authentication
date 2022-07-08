
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/presentation/helper/constants.dart';

buildForm(BuildContext context,{required TextEditingController controller, required bool obscure, required String hintText,
    required String labelText, String? Function(String? val)? validator}) {
  return Container(
    alignment: Alignment.center,
    width: context.width() * .8,
    height: context.height() * .08,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.black, style: BorderStyle.solid),
    ),
    child: TextFormField(
      validator: validator,
      obscureText: obscure,
      controller: controller,
      cursorHeight: 25,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26, fontSize: 15),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10)),
    ),
  );
}
