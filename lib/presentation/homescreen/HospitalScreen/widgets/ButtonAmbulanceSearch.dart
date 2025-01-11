import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';

class Buttonambulancesearch extends StatelessWidget {
  final String text;
  final VoidCallback onClick; 

  const Buttonambulancesearch({
    required this.text,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primaryGreen,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.secondaryGrey,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    )
    );
  }
}