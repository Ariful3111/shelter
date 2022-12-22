import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logics/auth.dart';
import '../conts/app_color.dart';
import '../styles/styles.dart';
import '../widgets/violet_button.dart';

class Signin extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ('Login\nTo Your Account'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.sp,
                    color: AppColors.violedColor,
                  ),
                ),

                TextFormField(
                  controller: _emailController,
                  decoration:
                      AppStyles().textfilleddecoration('E-mail Address'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration:
                      AppStyles().textfilleddecoration('Enter Password'),
                ),
                SizedBox(
                  height: 100.h,
                ),
                VioletButton('Login',
                        (){
                      final userEmail = _emailController.text;
                      final userPass = _passwordController.text;
                      var obj = Auth();
                      // obj.signIN(userEmail, userPass, context);
                      FirebaseAuth.instance.signOut();
                    }
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    ('OR'),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/google.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        ('assets/icons/Facebook_Logo.png'),
                        height: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have registered yet? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: AppColors.violedColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
