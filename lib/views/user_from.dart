import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/business_logics/from.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:tour_application/widgets/violet_button.dart';
import '../conts/app_color.dart';
import '../styles/styles.dart';

class UserFrom extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  Rx<TextEditingController> _dateController = TextEditingController().obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;

  String? dob=null;

  String gender = 'Male';

  XFile? _image;

  String? imageurl;

  _date(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (date != null && date != selectedDate) {
      _dateController.value.text = '${date.day}-${(date.month)}-${(date.year)}';
    }
  }

  // _Choseimage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   _image = await _picker.pickImage(source: ImageSource.gallery);
  // }

  // _writedata() async {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ('Tell Us More About You.'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: AppColors.violedColor,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  ('We will not share your information\n outside this application.'),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Center(
                //   child: Text(
                //     ('Add your profile picture'),
                //     style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 15.sp,
                //       color: AppColors.violedColor,
                //     ),
                //   ),
                // ),
                // Center(
                //   child: Material(
                //       child: _image == null
                //           ? IconButton(
                //               onPressed: () {
                //                 _Choseimage();
                //               },
                //               icon: Icon(Icons.photo),
                //             )
                //           : Image.file(
                //               File(_image!.path),
                //             ),),
                // ),
                AppStyles()
                    .FromFilled(TextInputType.name, _nameController, 'name'),
                AppStyles().FromFilled(
                    TextInputType.number, _phoneController, 'Phone Number'),
                AppStyles().FromFilled(
                    TextInputType.streetAddress, _addressController, 'Address'),
                Obx(
                  () => TextFormField(
                    controller: _dateController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'date of birth',
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _date(context);
                        },
                        icon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ToggleSwitch(
                  minWidth: 90.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Male', 'Female'],
                  icons: [Icons.male_sharp, Icons.female_sharp],
                  activeBgColors: [
                    [Colors.blue],
                    [Colors.pink]
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      gender = 'Male';
                    } else {
                      gender = 'Female';
                    }
                    print('switched to: $index');
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                VioletButton(
                  'Submit',
                  () => UsersInfo().sendFormDataToDB(
                      _nameController.text,
                     int.parse(_phoneController.text),
                      _addressController.text,
                      dob ?? 'null',
                      gender),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
