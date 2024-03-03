import 'package:started_app/app/res/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: getPaddingValue(CustomPadding.medium),
          child: Text(text, style: Get.textTheme.titleLarge),
        ));
  }
}
