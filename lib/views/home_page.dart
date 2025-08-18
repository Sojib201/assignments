import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../controllers/home_controller.dart';
import '../controllers/permission_controller.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/responsives.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();
  final perm = Get.find<PermissionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Responsive.width(AppConstants.defaultPadding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Responsive.height(16)),
              Text('Hello,', style: Theme.of(context).textTheme.titleMedium),
              Obx(() => Text(
                controller.userName.value,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: Responsive.height(16)),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    await perm.requestPhoto();
                    Get.snackbar(
                      'Permission',
                      perm.photoGranted.value
                          ? 'Photo permission granted'
                          : 'Permission denied',
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: Responsive.width(88),
                        height: Responsive.width(88),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.camera_alt_outlined, size: Responsive.width(32)),
                      ),
                      SizedBox(height: Responsive.height(8)),
                      const Text('Add Image'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Responsive.height(16)),
              Container(
                padding: EdgeInsets.all(Responsive.width(16)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Responsive.width(AppConstants.borderRadius)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _counter('Applied', controller.appliedCount),
                    Icon(Icons.chevron_right_rounded, size: Responsive.width(24)),
                    _counter('In Progress', controller.inProgressCount),
                    Icon(Icons.chevron_right_rounded, size: Responsive.width(24)),
                    _counter('Completed', controller.completedCount),
                    Icon(Icons.chevron_right_rounded, size: Responsive.width(24)),
                  ],
                ),
              ),
              SizedBox(height: Responsive.height(24)),
              _menuTile(
                icon: Icons.person_outline,
                title: 'My Info',
                onTap: () => Get.toNamed(Routes.myInfo),
              ),
              _menuTile(
                icon: Icons.campaign_outlined,
                title: 'Campaign Matching',
                onTap: () => Get.toNamed(Routes.campaign),
              ),
              _menuTile(icon: Icons.notifications_none, title: 'Notices'),
              _menuTile(icon: Icons.chat_bubble_outline, title: '1:1 Inquiry'),
              _menuTile(icon: Icons.help_outline, title: 'FAQ'),
              _menuTile(icon: Icons.description_outlined, title: 'Terms & Policy'),
              _menuTile(icon: Icons.logout, title: 'Logout'),
              _menuTile(icon: Icons.delete_outline, title: 'Delete Account'),
              SizedBox(height: Responsive.height(24)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTile({required IconData icon, required String title, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: Responsive.width(28), color: AppColors.textPrimary),
          title: Text(title, style: TextStyle(fontSize: Responsive.font(16))),
          trailing: Icon(Icons.chevron_right, size: Responsive.width(24)),
          onTap: onTap,
        ),
        Divider(height: 1),
      ],
    );
  }

  Widget _counter(String label, RxInt value) {
    return Obx(() => Column(
      children: [
        Text(
          value.value.toString(),
          style: TextStyle(
            fontSize: Responsive.font(28),
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: Responsive.height(4)),
        Text(label, style: TextStyle(fontSize: Responsive.font(14))),
      ],
    ));
  }
}
