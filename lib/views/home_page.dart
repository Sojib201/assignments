import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../controllers/home_controller.dart';
import '../controllers/permission_controller.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text('Hello,', style: Theme.of(context).textTheme.titleMedium),
              Obx(() => Text(
                controller.userName.value,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    // Request permission to choose photo
                    await perm.requestPhoto();
                    Get.snackbar('Permission',
                        perm.photoGranted.value ? 'Photo permission granted' : 'Permission denied');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200, shape: BoxShape.circle),
                        child: const Icon(Icons.camera_alt_outlined, size: 32),
                      ),
                      const SizedBox(height: 8),
                      const Text('Add Image'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05), blurRadius: 10)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _counter('Applied', controller.appliedCount),
                    const Icon(Icons.chevron_right_rounded),
                    _counter('In Progress', controller.inProgressCount),
                    const Icon(Icons.chevron_right_rounded),
                    _counter('Completed', controller.completedCount),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _menuTile(
                  icon: Icons.person_outline,
                  title: 'My Info',
                  onTap: () => Get.toNamed(Routes.myInfo)),
              _menuTile(
                  icon: Icons.campaign_outlined,
                  title: 'Campaign Matching',
                  onTap: () => Get.toNamed(Routes.campaign)),
              _menuTile(icon: Icons.notifications_none, title: 'Notices'),
              _menuTile(icon: Icons.chat_bubble_outline, title: '1:1 Inquiry'),
              _menuTile(icon: Icons.help_outline, title: 'FAQ'),
              _menuTile(icon: Icons.description_outlined, title: 'Terms & Policy'),
              _menuTile(icon: Icons.logout, title: 'Logout'),
              _menuTile(icon: Icons.delete_outline, title: 'Delete Account'),
              const SizedBox(height: 24),
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
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _counter(String label, RxInt value) {
    return Obx(() => Column(
      children: [
        Text(value.value.toString(),
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6D35D3))),
        const SizedBox(height: 4),
        Text(label),
      ],
    ));
  }
}
