import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medcave/presentation/homescreen/HospitalScreen/pages/HospitalScreenUser.dart';
import 'package:medcave/presentation/loginsignup/login/login.dart';
import 'package:medcave/presentation/loginsignup/signup/signup.dart';
import 'package:medcave/presentation/main/navigation/navigation.dart';
import 'firebase_options.dart';
import 'package:medcave/core/confiq/theme/theme.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/AmbulanceScreenDriver.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/slider.dart';
import 'package:medcave/presentation/splashscreen/pages/splash_screen.dart';

import 'presentation/loginsignup/auth_wrapper.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashToAuth(),
        '/login': (context) => const loginScreen(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const BNavigationBar(),
      },
    );
  }
}
class SplashToAuth extends StatefulWidget {
  const SplashToAuth({super.key});

  @override
  State<SplashToAuth> createState() => _SplashToAuthState();
}

class _SplashToAuthState extends State<SplashToAuth> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthWrapper()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}