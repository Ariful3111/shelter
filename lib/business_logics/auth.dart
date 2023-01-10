import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:get_storage/get_storage.dart';

class Auth {
  final box=GetStorage();
  //sign up Authentication
  Future signup(email, password, context) async {
    try {
      UserCredential _usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var _authcredential = _usercredential.user;
      print(_authcredential);

      if (_authcredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(
          msg: 'Sign-Up Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
        box.write('id',_authcredential.uid);
        Get.toNamed(userfrom);
      } else {
        Fluttertoast.showToast(
          msg: 'Sign-Up Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: 'The Password is too weak',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Unexpected Error!!${e} ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 20.sp,
      );
    }
  }

  //sign in Authentication

  Future signin(email, password, context) async {
    try {
      UserCredential _usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var _authcredential = _usercredential.user;
      print(_authcredential);

      if (_authcredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(
          msg: 'Sign-In Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
        box.write('id',_authcredential.uid);
        Get.toNamed(bottomnav);
      } else {
        Fluttertoast.showToast(
          msg: 'Sign-In Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: 'The Password is too weak',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 20.sp,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Unexpected Error!!${e} ',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 20.sp,
      );
    }
  }
}
