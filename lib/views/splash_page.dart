import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      Get.offAllNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B1D8B),
      body: const Center(
        child: Text('MY FLYN', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
