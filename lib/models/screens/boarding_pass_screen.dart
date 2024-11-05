import 'package:flutter/material.dart';
import 'package:midterm_project_flutter/models/flight.dart';
import 'package:provider/provider.dart';
import './BookingHistoryScreen.dart'; // Ensure to import the booking history screen

class BoardingPassScreen extends StatelessWidget {
  const BoardingPassScreen({super.key, required Flight flight});

  @override
  Widget build(BuildContext context) {
    final flight = Provider.of<FlightModel>(context).flights.last;

    return Scaffold(
             appBar: AppBar(
  backgroundColor: Color(0xff00649C),
  title: const Text('Flight Information', style: TextStyle(color: Colors.white)),
  centerTitle: true, // This centers the title
  iconTheme: IconThemeData(
    color: Colors.white, 
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            
            // Flight information card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow('Flight:', '${flight.from} to ${flight.to}', Icons.flight_takeoff),
                    const SizedBox(height: 10),
                    buildInfoRow('Departure Date:', flight.departureDate, Icons.calendar_today),
                    const SizedBox(height: 10),
                    buildInfoRow('Booking Date:', flight.bookingDate, Icons.event),
                    const SizedBox(height: 10),
                    buildInfoRow('Booking Time:', flight.bookingTime, Icons.access_time),
                    const SizedBox(height: 10),
                    buildInfoRow('Booked By:', flight.buyerName, Icons.person),
                    const SizedBox(height: 10),
                    buildInfoRow('Airline:', flight.airline, Icons.airplanemode_active),
                  ],
                ),
              ),
            ),
            const Spacer(), // Push buttons to the bottom

            // Return Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00649C),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text('Return', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 15),
            
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingHistoryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00649C),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text('View Booking History', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),

      
    );
  }

  // Helper function to build rows with icons and text for flight info
  Widget buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xff00649C)),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
