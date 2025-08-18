import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final photoGranted = false.obs;

  Future<void> requestPhoto() async {
    final status = await Permission.photos.request();
    photoGranted.value = status.isGranted;
  }

  Future<void> requestStorage() async {
    final status = await Permission.storage.request();
    photoGranted.value = status.isGranted;
  }
}
