import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  TextStyle myTextStyle =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,);
  InputDecoration textfilleddecoration(String hint)=>InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 15.sp,
    ),
  );
  TextFormField FromFilled(keyboard, controller, hint)=>TextFormField(
    keyboardType: keyboard,
    controller: controller,
    decoration: AppStyles().textfilleddecoration(hint),
  );
}
