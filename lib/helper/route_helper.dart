import 'package:get/get.dart';
import 'package:sunday_mall/views/auth/login/otp_verification.dart';
import 'package:sunday_mall/views/auth/login/signin_with_employeeid.dart';
import 'package:sunday_mall/views/auth/signup/business_details_screen.dart';
import 'package:sunday_mall/views/auth/signup/signup_screen.dart';
import 'package:sunday_mall/views/onboarding/final_onboad.dart';
import 'package:sunday_mall/views/profile/my_work_profile.dart';
import 'package:sunday_mall/views/screens/mainscreen.dart';
import 'package:sunday_mall/views/screens/product_deatls_screen.dart';
import 'package:sunday_mall/views/screens/search_filter.dart';
import 'package:sunday_mall/widgets/homescreen/add_to_cart.dart';
import '../views/onboarding/onboading_screen.dart';
import '../views/paymet/add_card_screen.dart';
import '../views/paymet/shipping_address_checklist.dart';
import '../views/paymet/add_shipping_address.dart';
import '../views/paymet/payment_method_screen.dart';
import '../views/paymet/shipping_address_screen.dart';
import '../views/screens/cancelsupportscreen.dart';
import '../views/screens/order_details_screen.dart';
import '../views/screens/order_screen.dart';
import '../views/screens/review_&_submit_cancellation.dart';
import '../widgets/homescreen/shopping_cart_detail.dart';

class RouteHelper{

  /// page name
  static String onboardingScreen = '/onboarding-screen';
  static String finalOnboardingScreen = '/final-onboarding-screen';
  static String otpVerificationScreen = '/otp-verification-screen';
  static String signinWithEmployeeidScreen = '/sign-in-with-emploeeid';
  static String signUpScreen = '/sign-up-screen';
  //static String otpVerificationScreen = '/otp-verification-screen';
  static String mainScreen = '/main-screen';
  static String businessDetailsScreen = '/business-details-screen';
  static String myWorkProfileScreen = '/my-Work-Profile-Screen';


  /// Screen name get
  // static String getOnboardingScreen(String name) => '$onboardingScreen?name=$name';
  static String getOnboardingScreen() => onboardingScreen;
  static String getFinalOnboardingScreen() => finalOnboardingScreen;
  static String getOtpVerificationScreen(String number) =>  "$otpVerificationScreen?number=$number"
  //static String getOtpVerificationScreen(String number) => "$otpVerificationScreen?number=$number";




  /// Screens
  static List<GetPage> routes = [
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen(),),
    GetPage(name: finalOnboardingScreen, page: () => const FinalOnboardingScreen(),),
    GetPage(name: otpVerificationScreen, page: () =>  OtpVerificationScreen(phoneNumber: Get.parameters['number']!)),
    GetPage(name: signinWithEmployeeidScreen, page: () => SigninWithEmployeeidScreen()),
    GetPage(name: signUpScreen, page: ()=> const SignupScreen()),
    GetPage(name: mainScreen, page: ()=>  MainScreen()),
    GetPage(name: businessDetailsScreen, page: ()=>  BusinessDetailsScreen()),

   // GetPage(name: otpVerificationScreen, page: () => ForgotPasswordOtpVerificationScreen(phoneNumber: Get.parameters['number'] ?? ''),),
    // GetPage(name: splashScreen, page: () => const SplashScreen(),),
    // GetPage(name: onboardingScreen, page: () => OnboardingScreen(
    //   name: Get.parameters['name'] ?? '',
    // )),
  ];
}
