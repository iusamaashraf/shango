import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shango/constants/validators.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ValidationMixin {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.gallery);
            },
            child: Row(
              children: [
                const Icon(Icons.image, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Text(
                      'First register\nYourself',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      'Please provide all your information to create account...',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showOptionDialog(
                            context,
                          );
                        },
                        child: Container(
                          height: Get.height * 0.2,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(
                                color: ColorClass.primaryColor, width: 2),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/person.png',
                                      fit: BoxFit.contain,
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    PrimaryField(
                      textInputType: TextInputType.name,
                      controller: nameController,
                      prefixIcon: Icons.person,
                      hintText: 'John Dosan',
                      validator: (value) {
                        return;
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
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
                      height: Get.height * 0.02,
                    ),
                    PrimaryField(
                      textInputType: TextInputType.number,
                      controller: phoneController,
                      prefixIcon: Icons.phone,
                      hintText: '+923001234567',
                      validator: (value) {
                        return;
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    PrimaryField(
                      isObscure: true,
                      textInputType: TextInputType.name,
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      hintText: 'password',
                      validator: (value) {
                        return;
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    PrimaryButton(
                      onTap: () {},
                      text: 'Create Account',
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Align(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Already have an account? Sign in",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
          ],
        ),
      ),
    );
  }
}
