import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../flight.dart';

class ChooseDateScreen extends StatelessWidget {
  const ChooseDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flights = Provider.of<FlightModel>(context).flights;

    return Scaffold(
      appBar: AppBar(title: const Text('Vé bạn đã đặt')),
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('From: ${flights[index].from}'),
            subtitle: Text(
                'To: ${flights[index].to} - Date: ${flights[index].departureDate}'),
          );
        },
      ),
    );
  }
}
