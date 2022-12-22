import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tour_application/conts/app_string.dart';
import 'package:tour_application/conts/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_application/styles/styles.dart';
import 'package:tour_application/ui/route/route.dart';

import '../styles/styles.dart';

class Onboarding_screen extends StatelessWidget {
  List<String> _lottiefiles = [
    'assets/file/welcome.json',
    'assets/file/support.json',
    'assets/file/catagories.json',
  ];

  List<String> _title = [
    'Welcome',
    'Categories',
    'Support',
  ];

  List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  ];

  RxInt _currentindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                flex: 2,
                child: Lottie.asset(_lottiefiles[_currentindex.toInt()]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          spreadRadius: 1.0),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 5,
                        spreadRadius: 1.0,
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Obx(
                        () => Text(
                          ('${_title[_currentindex.toInt()]}'),
                          style: AppStyles().myTextStyle,
                        ),
                      ),
                      Obx(
                        () => Text(
                          ('${_description[_currentindex.toInt()]}'),
                          style: AppStyles().myTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => DotsIndicator(
                              dotsCount: _lottiefiles.length,
                              position: _currentindex.toDouble(),
                              decorator: DotsDecorator(),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_currentindex == _lottiefiles.length-1) {
                                Get.toNamed(signup);
                              } else {
                                _currentindex+1;
                              }
                            },
                            child: Container(
                              height: 37.h,
                              width: 37.w,
                              decoration: BoxDecoration(
                                  color: AppColors.scaffoldColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 10,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 5,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              child: Icon(Icons.double_arrow_sharp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
