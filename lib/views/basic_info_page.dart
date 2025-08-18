import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/myinfo_controller.dart';
import '../widgets/labeled_field.dart';
import '../widgets/primary_button.dart';

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
    final portfolioFile =
    TextEditingController(text: c.portfolioFileName.value);

    void markDirty() => c.markDirty();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Basic Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledField(
                label: 'ID',
                controller: TextEditingController(text: c.userId.value),
                readOnly: true,
              ),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Email',
                controller: email,
              )..controller.addListener(markDirty),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Phone Number',
                controller: phone,
                keyboardType: TextInputType.phone,
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Change'),
                  ),
                ),
              )..controller.addListener(markDirty),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Nickname',
                controller: nickname,
              )..controller.addListener(markDirty),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Instagram ID',
                controller: instagram,
              )..controller.addListener(markDirty),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Portfolio Link',
                controller: portfolioLink,
              )..controller.addListener(markDirty),
              const SizedBox(height: 16),
              LabeledField(
                label: 'Portfolio',
                controller: portfolioFile,
                trailing: const Icon(Icons.attach_file),
              )..controller.addListener(markDirty),
              const SizedBox(height: 24),
              Obx(
                    () => PrimaryButton(
                  label: 'Save',
                  disabled: !c.canSave.value,
                  onPressed: () {
                    c.canSave.value = false;
                    Get.snackbar('Saved', 'Your basic info has been updated.');
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
