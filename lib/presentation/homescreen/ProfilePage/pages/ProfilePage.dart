import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/fonts/font.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

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
