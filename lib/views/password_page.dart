import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/password_controller.dart';
import '../utils/responsives.dart';
import '../widgets/labeled_field.dart';
import '../widgets/primary_button.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class PasswordPage extends StatelessWidget {
  PasswordPage({super.key});
  final c = Get.find<PasswordController>();

  @override
  Widget build(BuildContext context) {
    final current = TextEditingController();
    final next = TextEditingController();
    final confirm = TextEditingController();

    void onChanged() {
      c.current.value = current.text;
      c.next.value = next.text;
      c.confirm.value = confirm.text;
      c.validate();
    }

    current.addListener(onChanged);
    next.addListener(onChanged);
    confirm.addListener(onChanged);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Set Password',
          style: TextStyle(
            fontSize: Responsive.font(20),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(Responsive.width(AppConstants.defaultPadding)),
        child: Column(
          children: [
            LabeledField(
              label: 'Current Password',
              controller: current,
              hint: '8-16 letters, numbers, symbols',
              obscure: true,
            ),
            SizedBox(height: Responsive.height(16)),
            LabeledField(
              label: 'New Password',
              controller: next,
              hint: '8-16 letters, numbers, symbols',
              obscure: true,
            ),
            SizedBox(height: Responsive.height(16)),
            LabeledField(
              label: 'Confirm Password',
              controller: confirm,
              hint: 'Re-enter the password',
              obscure: true,
            ),
            Spacer(),
            Obx(
                  () => PrimaryButton(
                label: 'Done',
                disabled: !c.valid.value,
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Updated',
                    'Password successfully changed',
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    colorText: AppColors.textPrimary,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
