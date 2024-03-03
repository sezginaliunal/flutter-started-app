import 'package:started_app/app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text('Forgot Password?',
          style: Get.textTheme.titleSmall
              ?.copyWith(color: AppColor.blackColor.withOpacity(.5))),
    );
  }
}
