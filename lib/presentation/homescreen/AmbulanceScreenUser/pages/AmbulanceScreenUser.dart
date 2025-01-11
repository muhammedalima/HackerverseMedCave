import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/fonts/font.dart';

import '../../AmbulanceScreenDriver/pages/slider.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenUser/pages/AmbulanceTracker.dart';

class Ambulancescreenuser extends StatefulWidget {
  const Ambulancescreenuser({super.key});

  @override
  State<Ambulancescreenuser> createState() => _AmbulancescreenuserState();
}

class _AmbulancescreenuserState extends State<Ambulancescreenuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7), // Light background color.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFECECEC), // Light grey color.
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black, // Arrow icon color.
              ),
              onPressed: () {
                Navigator.pop(context); // Back button functionality.
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Share the Situation?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Include conditions, injuries, and visible damage...",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    const Text(
                      "There’s been a car accident where a vehicle collided with a tree at high speed. The driver is unconscious with a possible head injury and chest trauma, while the passenger is awake but in severe pain, likely with a leg fracture. The impact was significant, and immediate medical attention is required to assess and stabilize both individuals. Please confirm the availability of an ambulance with advanced life support to respond quickly.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AmbulanceTracker()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF1D25E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "SEARCH AMBULANCE",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
