import 'package:flutter/material.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/pastRideList/pastRidelist.dart';
import '../../../../common/backgroundText/backgroundText.dart';
import '../currentRequests/currentRequests.dart';

bool isDriverReady = false; // Global variable to track driver's readiness

class SlideToTakeRide extends StatefulWidget {
  @override
  _SlideToTakeRideState createState() => _SlideToTakeRideState();
}

class _SlideToTakeRideState extends State<SlideToTakeRide> {
  double _sliderWidth = 60.0; // Initial width of the yellow box
  double _position = 0.0; // Position of the slider
  double _maxWidth = 0.0; // Maximum width of the black box
  bool _hasReachedEnd = false; // Flag to track if the slider reached the end

  @override
  void initState() {
    super.initState();
    // Set the initial position based on the global variable `isDriverReady`
    _position = isDriverReady ? _maxWidth - 60 : 0;
    _hasReachedEnd = isDriverReady; // If driver is ready, set flag to true
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                _maxWidth = constraints.maxWidth;

                // Determine the background color based on the slider position
                Color backgroundColor =
                    _position >= _maxWidth - 60 ? Colors.black : Colors.black.withOpacity(0.7);

                return Column(
                  children: [
                    Stack(
                      children: [
                        // Black background container with dynamic color change
                        Container(
                          width: _maxWidth,
                          height: 60,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _position >= _maxWidth - 60 ? "Stop the trip" : "Slide to take ride",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Yellow slider box
                        Positioned(
                          left: 0,
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              setState(() {
                                // Update the position of the slider
                                _position += details.delta.dx;

                                // Constrain the slider within bounds
                                if (_position < 0) _position = 0;
                                if (_position > _maxWidth - 60) _position = _maxWidth - 60;

                                // Update the width of the yellow box based on the position
                                _sliderWidth = _position + 60;
                              });
                            },
                            onHorizontalDragEnd: (details) {
                              setState(() {
                                // Update global variable based on slider position
                                if (_position >= _maxWidth - 60) {
                                  isDriverReady = true;
                                  _hasReachedEnd = true; // Set flag to true when slider reaches end
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Driver is ready to travel!")),
                                  );
                                } else if (_position <= 0) {
                                  isDriverReady = false;
                                  _hasReachedEnd = false; // Set flag to false when slider is not at end
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Driver is not ready.")),
                                  );
                                }
                              });
                            },
                            child: Container(
                              width: _sliderWidth,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Color.lerp(Colors.yellow, Colors.orange, _position / _maxWidth) ??
                                        Colors.yellow,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 224, 205, 28),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    _hasReachedEnd
                                        ? Icons.arrow_back_ios_new_outlined // Change arrow direction to back when slider reaches end
                                        : Icons.arrow_forward_ios_outlined, // Default arrow direction
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20), // Space between slider and content
            CurrentRequestsWidget(),
            PastRidesTestList(),
            const CustomImageTextWidget(text: "Your Health Our Care"),
          ],
        ),
      ),
    );
  }
}
