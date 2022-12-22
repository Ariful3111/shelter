import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tour_application/ui/route/route.dart';

class User_info {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  sendFromDataToDB(
      String name, int phone, String address, String dob, String gender) async {
    try {
      CollectionReference _course =
          FirebaseFirestore.instance.collection('user-from-data');
      _course.doc(_auth.currentUser!.email).set({
        'name': name,
        'phone': phone,
        'address': address,
        'dob': dob,
        'gender': gender,
      }).whenComplete((){
        Fluttertoast.showToast(msg: 'Added Successfully');
        Get.toNamed(privacy);
      },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: 'error: $e');
    }
  }
}