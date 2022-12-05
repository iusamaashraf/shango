import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shango/constants/icons.dart';
import 'package:shango/views/pages/authentication/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => Get.offAll(() => SignInPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              IconClass.splashIcon,
              height: Get.height,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
