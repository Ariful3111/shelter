import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_application/views/sign_in.dart';
import 'package:tour_application/views/signup_screen.dart';
import 'package:tour_application/views/splash_screen.dart';
import 'package:tour_application/views/onboardoing_screen.dart';
import 'package:tour_application/views/user_from.dart';
import '../../Drawer_Items/FAQ.dart';
import '../../Drawer_Items/How_to_use.dart';
import '../../Drawer_Items/Privacy_Screen.dart';
import '../../Drawer_Items/Settings.dart';
import '../../Drawer_Items/Support.dart';
import '../../views/bottomnav.dart';
import '../../views/drawer_screen.dart';
import '../../views/main_home_screen.dart';
import '../../views/privecy.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String signup = "/signup";
const String signin = '/signin';
const String userfrom = '/userfrom';
const String privacy = '/ptivacy';
const String bottomnav = '/bottomnav';
const String main_home_screen = '/main-home-screen';
const String drawer_screen = '/drawer-home-screen';
const String support = '/Support';
const String privacy_Screen = '/Privacy';
const String faq = '/FAQ';
const String how_to_use = '/how-to-use';
const String settings = '/Settings';


// control your page route

List<GetPage> getpages = [
  GetPage(name: splash, page: () => Splash_screen()),
  GetPage(name: onboarding, page: () => Onboarding_screen()),
  GetPage(name: signup, page: () => Signup()),
  GetPage(name: signin, page: () => Signin()),
  GetPage(name: userfrom, page: () => UserFrom()),
  GetPage(name: privacy, page: () => Privacy()),
  GetPage(name: bottomnav, page: () => BottomNav()),
  GetPage(name: main_home_screen, page: () => MainHomeScreen()),
  GetPage(name: drawer_screen, page: () => DrawerScreen()),
  GetPage(name: support, page: () => Support()),
  GetPage(name: privacy_Screen, page: () => Privacy_Screen()),
  GetPage(name: faq, page: () => FAQ()),
  GetPage(name: how_to_use, page: () => How_to_use()),
  GetPage(name: settings, page: () => Settings()),

];
