import 'package:flutter/material.dart';
import 'package:midterm_project_flutter/models/screens/home_screen.dart';


class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 181, 213, 240),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Illustration (replace with your own image asset)
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: Image.asset(
                  'assets/imgnen/nen.png', // Make sure to include this in your assets folder
                  height: 400,
        
                  fit: BoxFit.contain,
                ),
              ),
              
              // Text content
              const Column(
                children: [
                  Text(
                    'Go wherever you want',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'With Best Plane you can find the perfect tickets for your dream trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
        
              // Get Started button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00649C), // Background color of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}