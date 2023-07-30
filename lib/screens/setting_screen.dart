import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../core.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipInY(
      delay: const Duration(milliseconds: 800),
      child: CustomButton(
          text: 'Log Out', onPressed: () => AuthMethods().signOut()),
    );
  }
}
