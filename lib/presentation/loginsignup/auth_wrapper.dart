// auth_wrapper.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcave/presentation/homescreen/HospitalScreen/pages/HospitalScreenUser.dart';
import 'package:medcave/presentation/loginsignup/login/login.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late Stream<User?> _authStream;
  bool? _hasSeenOnboarding;

  @override
  void initState() {
    super.initState();
    _authStream = FirebaseAuth.instance.authStateChanges();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    // final prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   _hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStream,
      builder: (context, snapshot) {
        // Show loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting ||
            _hasSeenOnboarding == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // If we have a user, they're logged in
        if (snapshot.hasData) {
          print("User is authenticated, navigating to HospitalScreen");
          return const Hospitalscreenuser();
        }
        // if (snapshot.hasData) {
        //   // User is logged in
        //   if (!_hasSeenOnboarding!) {
        //     // First time user
        //     return const Onboardingscreen1();
        //   }
        //   // Returning user
        //   return const Hospitalscreenuser();
        // }

        // No user, show login page
        print("No user found, showing LoginPage");
        return const loginScreen();
      },
    );
  }
}
