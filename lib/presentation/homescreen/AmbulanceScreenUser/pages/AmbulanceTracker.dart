import 'package:flutter/material.dart';
import 'dart:async';

class AmbulanceTracker extends StatefulWidget {
  
  const AmbulanceTracker({Key? key}) : super(key: key);

  @override
  State<AmbulanceTracker> createState() => _AmbulanceTrackerState();
}

class _AmbulanceTrackerState extends State<AmbulanceTracker> {
  int currentStep = 0;
  bool showRequestAccepted = false;
  bool showAmbulanceReached = false;
  bool isLoading1 = false;  // Loading state for first transition
  bool isLoading2 = false;  // Loading state for second transition

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    // Start loading for first transition
    setState(() {
      isLoading1 = true;
    });

    // First transition after 4 seconds
    Timer(const Duration(seconds: 4), () {
      setState(() {
        isLoading1 = false;
        currentStep = 1;
        showRequestAccepted = true;
      });
      
      // Start loading for second transition
      Timer(const Duration(seconds: 1), () {
        setState(() {
          isLoading2 = true;
        });
        
        // Second transition after 4 more seconds
        Timer(const Duration(seconds: 4), () {
          setState(() {
            isLoading2 = false;
            currentStep = 2;
            showAmbulanceReached = true;
          });
        });
      });
    });
  }

  Widget _buildLoadingIcon() {
    return const SizedBox(
      width: 24,
      height: 24,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Heart Icon
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(
                  Icons.favorite_border,
                  color: currentStep == 2 ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Status Text
              Text(
                currentStep == 0 
                  ? 'Ambulance is on the way!'
                  : currentStep == 1 
                    ? 'There are over 50\nambulances around you!'
                    : 'Ambulance Arrived',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 10),
              
              // Subtitle
              Text(
                currentStep == 0 
                  ? 'Just about 1 hour and 10 mint.'
                  : currentStep == 1 
                    ? 'Just hang tight and an ambulance\nwill pick you up soon.'
                    : 'Take Care and Stay Safe',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),
              
              // Status Steps
              _buildStatusStep(
                'Search for ambulance', 
                true,
                const Icon(Icons.check, color: Colors.white),
              ),
              
              _buildStatusStep(
                'Picked by an ambulance', 
                currentStep >= 1,
                isLoading1 
                  ? _buildLoadingIcon()
                  : currentStep >= 1 
                    ? const Icon(Icons.check, color: Colors.white)
                    : const Icon(Icons.close, color: Colors.white),
              ),
              
              if (showRequestAccepted)
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Request accepted by\nRamu Ambulance - 9181670 91061',
                    textAlign: TextAlign.center,
                  ),
                ),
              
              _buildStatusStep(
                'Ambulance reached', 
                currentStep >= 2,
                isLoading2 
                  ? _buildLoadingIcon()
                  : currentStep >= 2 
                    ? const Icon(Icons.check, color: Colors.white)
                    : const Icon(Icons.close, color: Colors.white),
              ),
              
              if (showAmbulanceReached)
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Ambulance Reached after 1\nhour of your request',
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusStep(String title, bool completed, Widget icon) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: completed ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}