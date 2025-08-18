import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_routes.dart';
import 'controllers/home_controller.dart';
import 'controllers/campaign_controller.dart';
import 'controllers/myinfo_controller.dart';
import 'controllers/password_controller.dart';
import 'controllers/permission_controller.dart';
import 'views/splash_page.dart';
import 'views/home_page.dart';
import 'views/campaign_page.dart';
import 'views/myinfo_page.dart';
import 'views/basic_info_page.dart';
import 'views/password_page.dart';
import 'views/interests_page.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Set your design size
      minTextAdapt: true, // This prevents _minTextAdapt LateInitializationError
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName, // Using constant from utils
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
            fontFamily: 'SF Pro',
          ),
          initialRoute: Routes.splash,
          getPages: [
            GetPage(name: Routes.splash, page: () => const SplashPage()),
            GetPage(
              name: Routes.home,
              page: () => HomePage(),
              binding: BindingsBuilder(() {
                Get.put(HomeController());
                Get.put(PermissionController());
              }),
            ),
            GetPage(
              name: Routes.campaign,
              page: () => CampaignPage(),
              binding: BindingsBuilder(() {
                Get.put(CampaignController());
              }),
            ),
            GetPage(name: Routes.myInfo, page: () => const MyInfoPage()),
            GetPage(
              name: Routes.basicInfo,
              page: () => BasicInfoPage(),
              binding: BindingsBuilder(() {
                Get.put(MyInfoController());
              }),
            ),
            GetPage(
              name: Routes.password,
              page: () => PasswordPage(),
              binding: BindingsBuilder(() {
                Get.put(PasswordController());
              }),
            ),
            GetPage(name: Routes.interests, page: () => const InterestsPage()),
          ],
        );
      },
    );
  }
}
