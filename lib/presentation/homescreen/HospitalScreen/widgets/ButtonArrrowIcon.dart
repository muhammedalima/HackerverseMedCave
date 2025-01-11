import 'package:flutter/material.dart';

class Buttonarrrowicon extends StatelessWidget {
  final double rotateAngle;

  const Buttonarrrowicon({this.rotateAngle = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Transform.rotate(
        angle: rotateAngle,
        child: const Icon(
          Icons.arrow_outward,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}