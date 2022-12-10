import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shango/constants/colors.dart';
import 'package:shango/views/pages/root/tabs/category/category_page.dart';
import 'package:shango/views/pages/root/tabs/home/home_page.dart';
import 'package:shango/views/pages/root/tabs/profile/profile_page.dart';
import 'package:shango/views/pages/root/tabs/search/search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _pages[selectedIndex],
                ),
              ),
              Center(
                child: Container(
                  height: Get.height * 0.07,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      color: ColorClass.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          // offset: Offset(0, 00),
                          blurRadius: 16,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomTab(Icons.home, 0),
                      bottomTab(Icons.add_business, 1),
                      bottomTab(Icons.search, 2),
                      bottomTab(Icons.person, 3),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTab(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 35,
              decoration: BoxDecoration(
                border: index == selectedIndex
                    ? const Border(
                        top: BorderSide(width: 3.0, color: Colors.white))
                    : null,
                gradient: index == selectedIndex
                    ? LinearGradient(
                        colors: [
                            Colors.grey.shade800,
                            Colors.black,
                          ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  icon,
                  color: index == selectedIndex
                      ? Colors.white
                      : Colors.grey.shade800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
