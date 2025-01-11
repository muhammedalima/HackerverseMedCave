import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:medcave/core/confiq/theme/theme.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/AmbulanceScreenDriver.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/slider.dart';
import 'package:medcave/presentation/splashscreen/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home:  SplashScreen(),
    );
  }
}
