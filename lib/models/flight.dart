import 'package:flutter/foundation.dart';

class Flight {
  final String from;
  final String to;
  final String departureDate;
  final String bookingDate;
  final String bookingTime;
  final String buyerName;
  final String airline;

  Flight({
    required this.from,
    required this.to,
    required this.departureDate,
    required this.bookingDate,
    required this.bookingTime,
    required this.buyerName,
    required this.airline,
  });
}

class FlightModel extends ChangeNotifier {
  final List<Flight> _flights = [];

  List<Flight> get flights => _flights;

  void addFlight(Flight flight) {
    _flights.add(flight);
    notifyListeners();
  }
}
