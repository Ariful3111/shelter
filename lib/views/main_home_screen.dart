
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/views/bottomnav.dart';

import 'drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {

  Future _exitDialog(context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Are You Sure To Close The App'),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){SystemNavigator.pop();}, child: Text("Yes")),
            SizedBox(width: 20.w,),
            ElevatedButton(onPressed: (){Get.back();}, child: Text("No")),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(

      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            BottomNav(),
          ],
        ),
      ),
    );
  }
}
