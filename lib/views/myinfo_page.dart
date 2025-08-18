import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text('My Info')),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Basic Info'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.toNamed(Routes.basicInfo)),
          const Divider(height: 1),
          ListTile(
              title: const Text('Set Password'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.toNamed(Routes.password)),
          const Divider(height: 1),
          ListTile(
              title: const Text('Interest Categories'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.toNamed(Routes.interests)),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
