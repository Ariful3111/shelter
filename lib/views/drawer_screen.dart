import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tour_application/conts/app_string.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:tour_application/views/drawer_item.dart';

class DrawerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.AppName,
              style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 32.sp,
              ),
            ),
            Text('Travel Agency',
              style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            DrawerItem(
              'support',
                ()=>Get.toNamed(support),
            ),
            DrawerItem(
              'Privacy',
                  ()=>Get.toNamed(privacy_Screen),
            ),
            DrawerItem(
              'FAQ',
                  ()=>Get.toNamed(faq),
            ),
            DrawerItem(
              'Rate us',
                  (){},
            ),
            DrawerItem(
              'How to use',
                  ()=>Get.toNamed(how_to_use),
            ),
            Expanded(child: SizedBox()),
            DrawerItem(
              'Settings',
                  ()=>Get.toNamed(settings),
            ),
          ],
        ),
      )
    );
  }
}
