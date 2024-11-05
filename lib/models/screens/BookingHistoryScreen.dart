import 'package:flutter/material.dart';
import 'package:midterm_project_flutter/models/screens/boarding_pass_screen.dart';
import 'package:provider/provider.dart';
import '../flight.dart';
 // Import BoardingPassScreen để hiển thị thông tin chi tiết

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flights = Provider.of<FlightModel>(context).flights;

    return Scaffold(
           appBar: AppBar(
  backgroundColor: Color(0xff00649C),
  title: const Text('Booking history', style: TextStyle(color: Colors.white)),
  centerTitle: true, // This centers the title
  iconTheme: IconThemeData(
    color: Colors.white, 
  ),
),

 backgroundColor: Color.fromARGB(255, 212, 230, 245),
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('From: ${flights[index].from} to ${flights[index].to}'),
            subtitle: Text('departure date: ${flights[index].departureDate}'),
            trailing: Text(flights[index].airline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BoardingPassScreen(flight: flights[index]),
                ),
              );
            },
          );
        },
      ),
        bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xff00649C),  
  type: BottomNavigationBarType.fixed,  
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.white), 
      label: '', 
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search, color: Colors.white), 
      label: '', 
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications, color: Colors.white), 
      label: '', 
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color: Colors.white), 
      label: '', 
    ),
  ],
  currentIndex: 0,
  onTap: (index) {
    
  },
  selectedItemColor: Colors.white,  
  unselectedItemColor: Colors.white, 
  showSelectedLabels: false,
  showUnselectedLabels: false,
),
    );
  }
}
