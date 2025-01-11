import 'package:flutter/material.dart';

import '../../../../../core/confiq/fonts/font.dart';

// A single RideCard widget
// class RideCard extends StatelessWidget {
//   final String from;
//   final String to;
//   final String date;
//   final String time;
//   final String title;

//   const RideCard({
//     required this.from,
//     required this.to,
//     required this.date,
//     required this.time,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "$from to $to",
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             "$date . $time - $title",
//             style: const TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           const Divider(thickness: 1),
//         ],
//       ),
//     );
//   }
// }

// // A function to create a RideCard with provided data
// Widget createRideCard(String from, String to, String date, String time, String title) {
//   return RideCard(
//     from: from,
//     to: to,
//     date: date,
//     time: time,
//     title: title,
//   );
// }

// // The testable widget for the list
// class PastRidesTestList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Hardcoded data for testing purposes
//     final List<Map<String, String>> testData = [
//       {"from": "Kalamassery", "to": "Kochi", "date": "22 Jun", "time": "4:30PM", "title": "Heart Attack"},
//       {"from": "Aluva", "to": "Kakkanad", "date": "23 Jun", "time": "2:30PM", "title": "Quick Delivery"},
//       {"from": "Edapally", "to": "Vyttila", "date": "24 Jun", "time": "1:00PM", "title": "Medical Emergency"},
//       {"from": "Thrissur", "to": "Ernakulam", "date": "25 Jun", "time": "10:30AM", "title": "Business Meeting"},
//       {"from": "Angamaly", "to": "Perumbavoor", "date": "26 Jun", "time": "9:00AM", "title": "Friend's Visit"},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title Row
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: const Text(
//             "Past Rides",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),

//         // Generate the list of RideCard widgets using the createRideCard function
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: testData.length,
//           itemBuilder: (context, index) {
//             final ride = testData[index];
//             return createRideCard(
//               ride["from"]!,
//               ride["to"]!,
//               ride["date"]!,
//               ride["time"]!,
//               ride["title"]!,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }


// // import 'package:flutter/material.dart';

// // A single RideCard widget

class RideCard extends StatelessWidget {
  final String from;
  final String to;
  final String date;
  final String time;
  final String title;

  const RideCard({
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$from to $to",
            style: FontStyles.bodyStrong,
          ),
          const SizedBox(height: 4),
          Text(
            "$date . $time - $title",
            style: FontStyles.bodyBase,
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}

// A function to create a RideCard with provided data
Widget createRideCard(String from, String to, String date, String time, String title) {
  return RideCard(
    from: from,
    to: to,
    date: date,
    time: time,
    title: title,
  );
}

// Stateful widget to control the visibility of the rides
class PastRidesTestList extends StatefulWidget {
  @override
  _PastRidesTestListState createState() => _PastRidesTestListState();
}

class _PastRidesTestListState extends State<PastRidesTestList> {
  // To track whether to show all rides or just the first three
  bool showAllRides = false;

  // Hardcoded data for testing purposes
  final List<Map<String, String>> testData = [
    {"from": "Kalamassery", "to": "Kochi", "date": "22 Jun", "time": "4:30PM", "title": "Heart Attack"},
    {"from": "Aluva", "to": "Kakkanad", "date": "23 Jun", "time": "2:30PM", "title": "Quick Delivery"},
    {"from": "Edapally", "to": "Vyttila", "date": "24 Jun", "time": "1:00PM", "title": "Medical Emergency"},
    {"from": "Thrissur", "to": "Ernakulam", "date": "25 Jun", "time": "10:30AM", "title": "Business Meeting"},
    {"from": "Angamaly", "to": "Perumbavoor", "date": "26 Jun", "time": "9:00AM", "title": "Friend's Visit"},
  ];

  @override
  Widget build(BuildContext context) {
    // Determine which rides to show
    final List<Map<String, String>> visibleRides = showAllRides ? testData : testData.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row with "View All" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Past Rides",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
  onPressed: () {
    setState(() {
      // Toggle the visibility of all rides
      showAllRides = !showAllRides;
    });
  },
  style: TextButton.styleFrom(
    padding: EdgeInsets.zero, // Remove default padding
  ),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0), // Add padding inside the container
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.0), // Thin black border
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
    ),
    child: Text(
      showAllRides ? "View Less" : "View All",
      style: FontStyles.bodySmall,
    ),
  ),
),

            ],
          ),
        ),

        // Generate the list of RideCard widgets
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(visibleRides.length, (index) {
              final ride = visibleRides[index];
              return createRideCard(
                ride["from"]!,
                ride["to"]!,
                ride["date"]!,
                ride["time"]!,
                ride["title"]!,
              );
            }),
          ),
        ),
      ],
    );
  }
}


// 
// erial.dart';

// // A sample RideCard widget
// class RideCard extends StatelessWidget {
//   final String from;
//   final String to;
//   final String date;
//   final String time;
//   final String title;

//   const RideCard({
//     required this.from,
//     required this.to,
//     required this.date,
//     required this.time,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "$from to $to",
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             "$date . $time - $title",
//             style: const TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           const Divider(thickness: 1),
//         ],
//       ),
//     );
//   }
// }

// // The PastRidesList widget
// class PastRidesList extends StatefulWidget {
//   @override
//   _PastRidesListState createState() => _PastRidesListState();
// }

// class _PastRidesListState extends State<PastRidesList> {
//   List<Map<String, String>> rides = []; // Stores fetched ride data
//   bool expanded = false; // Whether the list is expanded

//   // Simulated database fetch function
//   Future<List<Map<String, String>>> fetchRidesFromDatabase() async {
//     // Replace this with your actual database query
//     await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
//     return List.generate(10, (index) {
//       return {
//         "from": "Kalamassery",
//         "to": "Kochi",
//         "date": "22 Jun",
//         "time": "4:30PM",
//         "title": "Heart Attack", // Custom title
//       };
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadRides();
//   }

//   void _loadRides() async {
//     List<Map<String, String>> data = await fetchRidesFromDatabase();
//     setState(() {
//       rides = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Decide the number of items to show based on expanded state
//     int itemCount = expanded ? rides.length : (rides.length > 3 ? 3 : rides.length);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title Row
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Past Rides",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     expanded = !expanded;
//                   });
//                 },
//                 child: Text(
//                   expanded ? "view less" : "view all",
//                   style: const TextStyle(fontSize: 14, color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // Rides List
//         ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: itemCount,
//           itemBuilder: (context, index) {
//             return RideCard(
//               from: rides[index]["from"]!,
//               to: rides[index]["to"]!,
//               date: rides[index]["date"]!,
//               time: rides[index]["time"]!,
//               title: rides[index]["title"]!,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
