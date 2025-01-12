// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class OnboardingData {
//   final String driverLicense;
//   final String phoneNumber;
//   final String name;
//   final bool isAmbulanceDriver;

//   OnboardingData({
//     this.driverLicense = '',
//     this.phoneNumber = '',
//     this.name = '',
//     this.isAmbulanceDriver = false,
//   });
// }

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({Key? key}) : super(key: key);

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   final _formKey = GlobalKey<FormState>();
//   int _currentPage = 0;
//   OnboardingData _data = OnboardingData();

//   Future<void> _saveOnboardingData() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
//           'driverLicense': _data.driverLicense,
//           'phoneNumber': _data.phoneNumber,
//           'name': _data.name,
//           'isAmbulanceDriver': _data.isAmbulanceDriver,
//         });

//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setBool('hasSeenOnboarding', true);
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving data: $e')),
//       );
//     }
//   }

//   Widget _buildLicensePage() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Hey there! Welcome to MedCave Ambulance Service!',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 40),
//           Image.asset('assets/ambulance.png', height: 200),
//           const SizedBox(height: 40),
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: 'Driver License Number',
//               border: OutlineInputBorder(),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _data = OnboardingData(
//                   driverLicense: value,
//                   phoneNumber: _data.phoneNumber,
//                   name: _data.name,
//                   isAmbulanceDriver: _data.isAmbulanceDriver,
//                 );
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPhonePage() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Hey there! Welcome to MedCave Ambulance Service!',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 40),
//           Image.asset('assets/ambulance.png', height: 200),
//           const SizedBox(height: 40),
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: 'Phone Number',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.phone,
//             onChanged: (value) {
//               setState(() {
//                 _data = OnboardingData(
//                   driverLicense: _data.driverLicense,
//                   phoneNumber: value,
//                   name: _data.name,
//                   isAmbulanceDriver: _data.isAmbulanceDriver,
//                 );
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDriverConfirmationPage() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Hey there! Welcome to MedCave Ambulance Service!',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 40),
//           Image.asset('assets/ambulance.png', height: 200),
//           const SizedBox(height: 40),
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: 'Your Name',
//               border: OutlineInputBorder(),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _data = OnboardingData(
//                   driverLicense: _data.driverLicense,
//                   phoneNumber: _data.phoneNumber,
//                   name: value,
//                   isAmbulanceDriver: _data.isAmbulanceDriver,
//                 );
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.amber,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _data = OnboardingData(
//                       driverLicense: _data.driverLicense,
//                       phoneNumber: _data.phoneNumber,
//                       name: _data.name,
//                       isAmbulanceDriver: true,
//                     );
//                   });
//                   _saveOnboardingData();
//                 },
//                 child: const Text('Yes'),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _data = OnboardingData(
//                       driverLicense: _data.driverLicense,
//                       phoneNumber: _data.phoneNumber,
//                       name: _data.name,
//                       isAmbulanceDriver: false,
//                     );
//                   });
//                   _saveOnboardingData();
//                 },
//                 child: const Text('No', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF8C9EFF),
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             children: [
//               _buildLicensePage(),
//               _buildPhonePage(),
//               _buildDriverConfirmationPage(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if (_currentPage > 0)
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   _pageController.previousPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//               ),
//             if (_currentPage < 2)
//               IconButton(
//                 icon: const Icon(Icons.arrow_forward),
//                 onPressed: () {
//                   _pageController.nextPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }