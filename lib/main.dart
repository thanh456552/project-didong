import 'package:flutter/material.dart';
import 'package:midterm_project_flutter/models/screens/start_app.dart';
import 'package:provider/provider.dart';
import './models/flight.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlightModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flight Booking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const StartApp(),
      ),
    );
  }
}
