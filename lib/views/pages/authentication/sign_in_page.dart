import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shango/constants/colors.dart';
import 'package:shango/constants/images.dart';
import 'package:shango/constants/validators.dart';
import 'package:shango/views/pages/authentication/forgot_password_page.dart';
import 'package:shango/views/pages/authentication/register_page.dart';

import '../../widgets/primary_button.dart';
import '../../widgets/primary_field.dart';
import '../root/root_page.dart';

class SignInPage extends StatelessWidget with ValidationMixin {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImagesClass.bgImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login\nTo continue',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              PrimaryField(
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: Icons.mail,
                hintText: 'Email',
                validator: (value) {
                  return;
                },
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              PrimaryField(
                textInputType: TextInputType.name,
                controller: passwordController,
                isObscure: true,
                prefixIcon: Icons.lock,
                hintText: 'Password',
                validator: (value) {
                  return;
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPasswordPage());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              PrimaryButton(
                onTap: () => Get.to(() => RootPage()),
                text: 'Login',
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Align(
                child: TextButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: Text(
                    "Didn't have an account? Signup",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorClass.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
