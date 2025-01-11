import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/fonts/font.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'This is Patent Page',
        style: FontStyles.titleHero,
      ),
    );
  }
}
