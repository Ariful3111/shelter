import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/conts/app_color.dart';

class VioletButton extends StatelessWidget {
  RxBool _value = false.obs;
  late String _title;
  final Function onAction;

  VioletButton(this._title, this.onAction);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: AppColors.violedColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
          ),
          child: _value == false
              ? Center(
                  child: Text(
                    _title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ('please wait'),
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Transform.scale(
                      scale: 0.4,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
