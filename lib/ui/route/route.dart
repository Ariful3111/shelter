import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_application/views/sign_in.dart';
import 'package:tour_application/views/signup_screen.dart';
import 'package:tour_application/views/splash_screen.dart';
import 'package:tour_application/views/onboardoing_screen.dart';
import 'package:tour_application/views/user_from.dart';

import '../../views/bottomnav.dart';
import '../../views/privecy.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String signup = "/signup";
const String signin = '/signin';
const String userfrom = '/userfrom';
const String privacy = '/ptivacy';
const String bottomnav = '/bottomnav';

// control your page route

List<GetPage> getpages = [
  GetPage(
    name: splash,
    page: () => Splash_screen(),
  ),
  GetPage(
    name: onboarding,
    page: () => Onboarding_screen(),
  ),
  GetPage(
    name: signup,
    page: () => Signup(),
  ),
  GetPage(
    name: signin,
    page: () => Signin(),
  ),
  GetPage(
    name: userfrom,
    page: () => UserFrom(),
  ),
  GetPage(
    name: privacy,
    page: () => Privacy(
    ),
  ),
  GetPage(
    name: bottomnav,
    page: () => BottomNav(),
  ),
];
