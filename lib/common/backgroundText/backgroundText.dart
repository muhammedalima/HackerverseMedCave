import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medcave/core/confiq/fonts/font.dart';

class CustomImageTextWidget extends StatelessWidget {
  final String text;
  // Path for the second SVG image

  // Constructor to accept data when the widget is used
  const CustomImageTextWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        // First SVG image
        SvgPicture.asset(
          'assets/vectors/upward.svg', // Path for the first SVG image
          width: 24, // Adjust size as needed
          height: 24, // Adjust size as needed
        ),
        const SizedBox(
          height: 24,
        ),
        // Second element - Text passed to the widget
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            text,
            style: FontStyles.titleHero,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        // Second SVG image
        SvgPicture.asset(
          'assets/vectors/downward.svg', // Path for the second SVG image
          width: 24, // Adjust size as needed
          height: 24, // Adjust size as needed
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
