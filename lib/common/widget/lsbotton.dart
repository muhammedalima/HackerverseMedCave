// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:medcave/core/confiq/colors/appcolor.dart';

// class MyButton extends StatelessWidget {
//   final Function()? onPressed;
//   final String buttonText;
//   final double buttonWidth;
//   final Color buttonColor;
//   const MyButton(
//       {super.key,
//       required this.onPressed,
//       required this.buttonColor,
//       required this.buttonText,
//       required this.buttonWidth});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 32,
//             vertical: 16,
//           ),
//           height: 56,
//           width: buttonWidth,
//           decoration: BoxDecoration(
//             color: buttonColor,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Text(
//             buttonText,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               color: AppColor.darkBlack,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
