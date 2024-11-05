import 'package:flutter/material.dart';
import 'search_flight_screen.dart';
// import 'choose_date_screen.dart';
import 'BookingHistoryScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xff00649C),
        leading: IconButton(
          iconSize: 35,
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon:const Icon(Icons.arrow_back)
          ),
       ),
       backgroundColor: Color(0xff00649C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            const Text(
              'Where do you want to go?',
              style: TextStyle(fontSize: 27,color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchFlightScreen()),
                );
              },
              child: const Text('Book tickets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),) ,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookingHistoryScreen()),
                );
              },
              child: const Text('See booked tickets', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
