import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/responsives.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          AppConstants.appName.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: Responsive.font(40),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
