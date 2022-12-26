import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_application/conts/app_string.dart';
import 'package:get/get.dart';
import 'package:tour_application/styles/styles.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:tour_application/views/bottomnav.dart';
import 'package:tour_application/views/onboardoing_screen.dart';
import 'package:tour_application/views/signup_screen.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  final box = GetStorage();
  _chosescreen(context) async {
    var _userid = box.read('id');
    if (_userid != null) {
      Get.toNamed(onboarding);
    } else {
      Get.toNamed(main_home_screen);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(onboarding));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ('assets/logo/app logo.png'),
              ),
              Text(
                (AppStrings.AppName),
                style: AppStyles().myTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
