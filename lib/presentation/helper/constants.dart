import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/presentation/helper/navigators.dart';

extension DeviceSize on BuildContext {
  width() => MediaQuery.of(this).size.width;
  height() => MediaQuery.of(this).size.height;
}

showdialog(
    {required BuildContext context,
    required String text,
    required String contentText}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            content: Text(
              contentText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            alignment: Alignment.center,
            actions: [
              InkWell(
                onTap: () => navigatePop(context),
                child: Text(
                  'okay',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              )
            ],
          ));
}
