import 'package:get/get.dart';

class PasswordController extends GetxController {
  final current = ''.obs;
  final next = ''.obs;
  final confirm = ''.obs;
  final valid = false.obs;

  void validate() {
    valid.value = next.value.isNotEmpty &&
        next.value == confirm.value &&
        next.value.length >= 8;
  }
}
