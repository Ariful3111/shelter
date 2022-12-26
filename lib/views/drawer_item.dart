import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget DrawerItem(String ItemName, Onclick){

  return InkWell(
    onTap: Onclick,
    child: Text(
    ItemName,
    style: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    ),
    ),
  );
}
