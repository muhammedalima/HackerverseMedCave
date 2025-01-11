import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/theme/theme.dart';
import 'package:medcave/presentation/splashscreen/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}
