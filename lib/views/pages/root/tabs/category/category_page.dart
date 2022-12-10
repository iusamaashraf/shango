import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shango/constants/colors.dart';
import 'package:shango/views/widgets/primary_field.dart';

import '../../../../../models/category_model.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final TextEditingController searchConytroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.05,
          ),
          child: Text(
            'Explore',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        PrimaryField(
          controller: searchConytroller,
          prefixIcon: Icons.search,
          validator: (validator) {
            return null;
          },
          hintText: 'Search your items',
          textInputType: TextInputType.name,
        ),
        // SizedBox(
        //   height: Get.height * 0.02,
        // ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: Get.height * 0.04),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: Get.height * 0.13,
                    decoration: BoxDecoration(
                        color: ColorClass.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          right: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              categoryList[index].imagePath!,
                              height: Get.height * 0.1,
                              color: ColorClass.lightBlueColor,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.14),
                        ),
                        Positioned(
                          // top: Get.height * 0.05,
                          left: 10,
                          child: Text(
                            categoryList[index].name!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
