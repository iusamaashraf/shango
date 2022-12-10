import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/images.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController emailController = TextEditingController();
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
        child: Stack(
          children: [
            Positioned(
              left: Get.width * 0.02,
              top: Get.height * 0.05,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.adaptive.arrow_back,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recover\nForgot password!',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Please enter your email to recover your password and continue your account',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  PrimaryField(
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icons.mail,
                    hintText: 'johny@gmail.com',
                    validator: (value) {
                      return;
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  PrimaryButton(
                    onTap: () {},
                    text: 'Done',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
