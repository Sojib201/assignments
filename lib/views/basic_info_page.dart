import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/myinfo_controller.dart';
import '../utils/responsives.dart';
import '../widgets/labeled_field.dart';
import '../widgets/primary_button.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class BasicInfoPage extends StatelessWidget {
  BasicInfoPage({super.key});
  final c = Get.find<MyInfoController>();

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController(text: c.email.value);
    final phone = TextEditingController(text: c.phone.value);
    final nickname = TextEditingController(text: c.nickname.value);
    final instagram = TextEditingController(text: c.instagram.value);
    final portfolioLink = TextEditingController(text: c.portfolioLink.value);
    final portfolioFile = TextEditingController(text: c.portfolioFileName.value);

    void markDirty() => c.markDirty();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Basic Info',
          style: TextStyle(fontSize: Responsive.font(20), fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Responsive.width(AppConstants.defaultPadding)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledField(
                label: 'ID',
                controller: TextEditingController(text: c.userId.value),
                readOnly: true,
              ),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Email',
                controller: email,
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Phone Number',
                controller: phone,
                keyboardType: TextInputType.phone,
                trailing: Padding(
                  padding: EdgeInsets.only(right: Responsive.width(8)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: TextStyle(fontSize: Responsive.font(14)),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(12),
                        vertical: Responsive.height(8),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Responsive.width(8)),
                      ),
                    ),
                  ),
                ),
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Nickname',
                controller: nickname,
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Instagram ID',
                controller: instagram,
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Portfolio Link',
                controller: portfolioLink,
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(16)),
              LabeledField(
                label: 'Portfolio',
                controller: portfolioFile,
                trailing: Icon(Icons.attach_file, size: Responsive.width(24), color: AppColors.textSecondary),
              )..controller.addListener(markDirty),
              SizedBox(height: Responsive.height(24)),
              Obx(
                    () => PrimaryButton(
                  label: 'Save',
                  disabled: !c.canSave.value,
                  onPressed: () {
                    c.canSave.value = false;
                    Get.snackbar(
                      'Saved',
                      'Your basic info has been updated.',
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      colorText: AppColors.textPrimary,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
