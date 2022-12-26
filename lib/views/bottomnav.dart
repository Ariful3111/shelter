import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../BottomNavigationBarPages/BottomNavigationBar_Adds.dart';
import '../BottomNavigationBarPages/BottomNavigationBar_Favorites.dart';
import '../BottomNavigationBarPages/BottomNavigationBar_home.dart';
import '../conts/app_string.dart';

class BottomNav extends StatelessWidget {
  RxInt _currentindex = 0.obs;
  RxBool _drawer = false.obs;
  final _pages = [
    Home(),
    Add(),
    Favorites(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: _drawer.value == false ? 0 : 100.h,
          left: _drawer.value == false ? 0 : 200.w,
          bottom: _drawer.value == false ? 0 : 50.h,
          right: _drawer.value == false ? 0 : 0.w,
          child: Container(
            decoration: BoxDecoration(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: _drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          _drawer.value = true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ))
                    : IconButton(
                        onPressed: () {
                          _drawer.value = false;
                        },
                        icon: Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                        )),
                title: Center(child: Text(AppStrings.AppName)),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) => _currentindex.value = value,
                  currentIndex: _currentindex.value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add), label: 'Add'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: 'Favorite'),
                  ]),
              body: _pages[_currentindex.value],
            ),
          ),
        ));
  }
}
