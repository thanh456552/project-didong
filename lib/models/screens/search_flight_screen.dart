import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../flight.dart';
import './boarding_pass_screen.dart';
import './BookingHistoryScreen.dart';

class SearchFlightScreen extends StatefulWidget {
  const SearchFlightScreen({super.key});

  @override
  _SearchFlightScreenState createState() => _SearchFlightScreenState();
}

class _SearchFlightScreenState extends State<SearchFlightScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController buyerNameController = TextEditingController();
  final String bookingDate = DateTime.now().toLocal().toString().split(' ')[0];
  final String bookingTime =
      DateTime.now().toLocal().toString().split(' ')[1].split('.')[0];

  final List<String> airlines = [
    'Vietnam Airlines',
    'Bamboo Airways',
    'VietJet Air',
    'Pacific Airlines',
    'Vasco (Vietnam Air Services Company)',
  ];

  List<Flight> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00649C),
        title: const Text('Good Morning, Jon',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 240, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Flight Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextFieldWithIcon(
                      controller: fromController,
                      label: 'From',
                      icon: Icons.location_on,
                    ),
                    const SizedBox(height: 15),
                    buildTextFieldWithIcon(
                      controller: toController,
                      label: 'To',
                      icon: Icons.flight_takeoff,
                    ),
                    const SizedBox(height: 15),
                    buildTextFieldWithIcon(
                      controller: departureDateController,
                      label: 'Departure',
                      icon: Icons.date_range,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          departureDateController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    buildTextFieldWithIcon(
                      controller: buyerNameController,
                      label: 'Your name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Choose an airline',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.airplanemode_active),
                      ),
                      items: airlines.map((String airline) {
                        return DropdownMenuItem<String>(
                          value: airline,
                          child: Text(airline),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00649C),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 6,
                        ),
                        onPressed: () {
                          final flight = Flight(
                            from: fromController.text,
                            to: toController.text,
                            departureDate: departureDateController.text,
                            bookingDate: bookingDate,
                            bookingTime: bookingTime,
                            buyerName: buyerNameController.text,
                            airline: "Airline A",
                          );

                          Provider.of<FlightModel>(context, listen: false)
                              .addFlight(flight);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookingHistoryScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: const Text('Search',style: TextStyle(color: Colors.white),),
                        ),
                      ),  
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
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

  Widget buildTextFieldWithIcon({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool readOnly = false,
    Function()? onTap,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: Icon(icon),
      ),
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
