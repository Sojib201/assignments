import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/responsives.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Interest Categories',
          style: TextStyle(
            fontSize: Responsive.font(20),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text(
          'Pick your interests here (demo screen).',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Responsive.font(16),
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
