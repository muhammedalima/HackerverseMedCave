// import 'package:flutter/material.dart';
// import 'package:medcave/core/confiq/colors/appcolor.dart';
// import 'package:medcave/core/confiq/fonts/font.dart';

// class MyTextField extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final controller;
//   final String hintText;
//   final bool obscureText;
//   final Icon prefixIcon;
//   final Function()? onChanged;

//   const MyTextField(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       required this.obscureText,
//       required this.prefixIcon,
//       this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       cursorColor: AppColor.primaryBlue,
//       decoration: InputDecoration(
//         hintText: hintText,
//         fillColor: AppColor.primaryGreen,
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//         hintStyle: FontStyles.bodySmall,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: prefixIcon,
//         //prefixIconColor: HexColor("#4f4f4f"),
//         filled: true,
//       ),
//     );
//   }
// }
