import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/theme/theme.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/AmbulanceScreenDriver.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/slider.dart';
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
      home:  AmbulancescreenDriver(),
    );
  }
}
