import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenDriver/pages/pastRideList/pastRidelist.dart';
import '../../../../common/backgroundText/backgroundText.dart';
import '../currentRequests/currentRequests.dart';

bool isDriverReady = false;

class SlideToTakeRide extends StatefulWidget {
  @override
  _SlideToTakeRideState createState() => _SlideToTakeRideState();
}

class _SlideToTakeRideState extends State<SlideToTakeRide> {
  double _sliderWidth = 60.0;
  double _position = 0.0;
  double _maxWidth = 0.0;
  bool _hasReachedEnd = false;

  @override
  void initState() {
    super.initState();
    _position = isDriverReady ? _maxWidth - 60 : 0;
    _hasReachedEnd = isDriverReady;
  }

  void _snapToNearestPosition() {
    // If slider is more than halfway, snap to end, otherwise snap to start
    if (_position > (_maxWidth - 60) / 2) {
      setState(() {
        _position = _maxWidth - 60;
        _sliderWidth = _maxWidth;
        _hasReachedEnd = true;
        isDriverReady = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Driver is ready to travel!")),
        );
      });
    } else {
      setState(() {
        _position = 0;
        _sliderWidth = 60;
        _hasReachedEnd = false;
        isDriverReady = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Driver is not ready.")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    _maxWidth = constraints.maxWidth;

                    Color backgroundColor = _position >= _maxWidth - 60
                        ? Colors.black
                        : Colors.black.withOpacity(0.7);

                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: _maxWidth,
                              height: 60,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _position >= _maxWidth - 60
                                    ? "Stop the trip"
                                    : "Slide to take ride",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  setState(() {
                                    _position += details.delta.dx;
                                    if (_position < 0) _position = 0;
                                    if (_position > _maxWidth - 60) {
                                      _position = _maxWidth - 60;
                                    }
                                    _sliderWidth = _position + 60;
                                  });
                                },
                                onHorizontalDragEnd: (details) {
                                  _snapToNearestPosition();
                                },
                                child: Container(
                                  width: _sliderWidth,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColor.primaryGreen,
                                        Color.lerp(
                                              AppColor.primaryGreen,
                                              AppColor.primaryGreen,
                                              _position / _maxWidth,
                                            ) ??
                                            AppColor.primaryGreen,
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
                                        color: AppColor.primaryGreen,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        _hasReachedEnd
                                            ? Icons.arrow_back_ios_new_outlined
                                            : Icons.arrow_forward_ios_outlined,
                                        color: AppColor.backgroundWhite,
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
                const SizedBox(height: 20),
                // Only show CurrentRequestsWidget when driver is ready
                if (isDriverReady) CurrentRequestsWidget(),
                PastRidesTestList(),
                const CustomImageTextWidget(text: "Your Health Our Care"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
