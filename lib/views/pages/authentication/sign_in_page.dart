import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shango/constants/colors.dart';
import 'package:shango/constants/images.dart';

class SignInPage extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryField(
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
                  onPressed: () {},
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
              SizedBox(
                width: Get.width,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ColorClass.primaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
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

class PrimaryField extends StatelessWidget {
  const PrimaryField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.isObscure = false,
    required this.validator,
    required this.hintText,
  });
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.06,

      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: validator,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey.shade400,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
