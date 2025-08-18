import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../utils/colors.dart';
import '../utils/responsives.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'My Info',
          style: TextStyle(
            fontSize: Responsive.font(20),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: [
          _menuTile('Basic Info', Routes.basicInfo),
          Divider(height: 1, color: Colors.grey.shade300),
          _menuTile('Set Password', Routes.password),
          Divider(height: 1, color: Colors.grey.shade300),
          _menuTile('Interest Categories', Routes.interests),
          Divider(height: 1, color: Colors.grey.shade300),
        ],
      ),
    );
  }

  Widget _menuTile(String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: Responsive.font(16),
          color: AppColors.textPrimary,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: Responsive.width(24),
        color: AppColors.textSecondary,
      ),
      onTap: () => Get.toNamed(route),
    );
  }
}
