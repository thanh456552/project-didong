import 'package:flutter/material.dart';
import '../flight.dart';

class FlightDetailScreen extends StatelessWidget {
  final Flight flight;

  const FlightDetailScreen({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin chuyến bay')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${flight.from}'),
            Text('To: ${flight.to}'),
            Text('Departure Date: ${flight.departureDate}'),
            Text('Booking Date: ${flight.bookingDate}'),
            Text('Booking Time: ${flight.bookingTime}'),
            Text('Buyer Name: ${flight.buyerName}'),
            Text('Airline: ${flight.airline}'),
          ],
        ),
      ),
    );
  }
}
