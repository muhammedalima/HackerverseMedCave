import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';

import '../../../../core/confiq/fonts/font.dart';

class CurrentRequestsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hardcoded data for current requests (can be replaced with actual dynamic data)
    final List<Map<String, String>> currentRequests = [
      {
        "from": "Kochi",
        "to": "Aluva",
        "date": "10 Jan",
        "time": "3:00PM",
        "title": "Urgent Pickup"
      },
      {
        "from": "Edapally",
        "to": "Thrissur",
        "date": "11 Jan",
        "time": "4:30PM",
        "title": "Emergency Response"
      },
      {
        "from": "Vyttila",
        "to": "Ernakulam",
        "date": "12 Jan",
        "time": "6:00PM",
        "title": "Hospital Transfer"
      },
      {
        "from": "Vyttila",
        "to": "Ernakulam",
        "date": "12 Jan",
        "time": "6:00PM",
        "title": "Hospital Transfer"
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Requests",
              style: FontStyles.heading,
            ),
            const SizedBox(height: 16),
            // Generate the list of requests using the currentRequests data
            ...currentRequests.map((request) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      32, // Full width minus padding
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColor
                        .primaryGreen, // Yellow background for the request box
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${request['from']} to ${request['to']}",
                        style: FontStyles.bodyStrong,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${request['date']} . ${request['time']} - ${request['title']}",
                        style: FontStyles.bodyBase,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
