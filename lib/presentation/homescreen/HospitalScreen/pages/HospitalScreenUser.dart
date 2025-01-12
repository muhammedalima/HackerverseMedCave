import 'package:flutter/material.dart';
import 'package:medcave/common/backgroundText/backgroundText.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';
import 'package:medcave/presentation/homescreen/AmbulanceScreenUser/pages/AmbulanceScreenUser.dart';
import 'package:medcave/presentation/homescreen/HospitalScreen/widgets/ButtonAmbulanceSearch.dart';

import '../widgets/ButtonArrrowIcon.dart';
import '../widgets/ShowCameraScreen.dart';

class Hospitalscreenuser extends StatefulWidget {
  const Hospitalscreenuser({Key? key}) : super(key: key);

  @override
  State<Hospitalscreenuser> createState() => _HospitalscreenuserState();
}

class _HospitalscreenuserState extends State<Hospitalscreenuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGrey, // Temporary for debugging
      appBar: AppBar(
        backgroundColor: AppColor.backgroundGrey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hey, Get',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'An Ambulance',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Buttonarrrowicon(
                              destination: Ambulancescreenuser(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Search with AI magic!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Buttonambulancesearch(
                          text: "You haven\'t searched yet!",
                          onClick: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Drug finder section - Now clickable
                GestureDetector(
                  onTap: () => showCameraScreen(context),
                  child: Container(
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
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Find out',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'what your drug is ?',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Buttonarrrowicon(
                            rotateAngle: 1.6,
                            destination: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const CustomImageTextWidget(
                  text: 'Your Health, Our Care',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
