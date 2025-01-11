import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/fonts/font.dart';

class Hospitalscreenuser extends StatelessWidget {
  const Hospitalscreenuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'This is Hospital Pages',
        style: FontStyles.titleHero,
      ),
    );
  }
}
