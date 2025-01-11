import 'package:flutter/material.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to match the design
      backgroundColor: const Color(0xFF7E73E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            const Text(
              "Welcome to MedCave Ambulance Service!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Space between the text and the image

            // Ambulance image
            Image.asset(
              'assets/ambulance.png', // Replace with the actual image path
              width: 200,
            ),
            SizedBox(height: 30), // Space between the image and the form

            // Login form container
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome back text
                  Text(
                    "Welcome Back!!!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 20), // Space between the text and input fields

                  // Email input field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter the mail id",
                      labelStyle: TextStyle(
                        color: AppColor
                            .darkBlack, // Ensure AppColor is defined correctly
                      ),
                      hintText: "name@gmail.com", // Place hint text here
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Rounded corners for the border
                      ),
                    ),
                  ),
                  SizedBox(height: 15), // Space between the input fields

                  // Password input field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter the password",
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between fields and buttons

                  // Login button
                  Row(
                    children: [
                      Spacer(), // Push the icon to the right
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          // Add login functionality
                        },
                        child: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Space between the button and text

                  // Create account link
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Add navigation to sign-up page
                      },
                      child: Text("New? Create An account"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
