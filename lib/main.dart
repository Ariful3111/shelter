import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/conts/app_color.dart';
import 'package:tour_application/conts/app_string.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:tour_application/views/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 //await Firebase.initializeApp();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final Future _initialization = Firebase.initializeApp(
    name: 'Shelter',
    options: FirebaseOptions(
        apiKey: "AIzaSyDDEdAMFuUyK9iGVK3leUARCJ4yjpIWRiU",
        appId: "1:502544384694:android:07a689919540ec6f029c17",
        messagingSenderId: "502544384694",
        projectId: "shelter-c28ba",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.AppName,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )
            ),
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
            scaffoldBackgroundColor: AppColors.scaffoldColor,
          ),
          initialRoute: main_home_screen,
          getPages: getpages,
          //home: Splash_screen(),
        );
      },
    );
  }
}
