import 'package:flutter/material.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text('Interest Categories')),
      body: const Center(child: Text('Pick your interests here (demo screen).')),
    );
  }
}
