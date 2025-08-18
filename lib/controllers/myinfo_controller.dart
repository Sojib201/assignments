import 'package:get/get.dart';

class MyInfoController extends GetxController {
  final userId = 'asdf123'.obs;
  final email = 'asdf123@naver.com'.obs;
  final phone = '010-1234-5678'.obs;
  final nickname = 'Jang Balsan'.obs;
  final instagram = 'ffkdo_sa'.obs;
  final portfolioLink = 'https://www.naver.com/'.obs;
  final portfolioFileName = 'portfolio.pdf'.obs;

  final canSave = false.obs;

  void markDirty() => canSave.value = true;
}
