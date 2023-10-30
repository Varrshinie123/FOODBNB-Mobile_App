import 'package:flutter/material.dart';

class ActiveBookingPage extends StatefulWidget {
  @override
  _ActiveBookingPageState createState() => _ActiveBookingPageState();
}

class _ActiveBookingPageState extends State<ActiveBookingPage> {
  // Dummy data for active bookings (you can replace this with your own data)
  final List<Booking> activeBookings = [
    Booking(id: 1, title: 'Booking 1', date: 'October 15, 2023', time: '3:00 PM'),
    Booking(id: 2, title: 'Booking 2', date: 'October 20, 2023', time: '7:30 PM'),
    Booking(id: 3, title: 'Booking 3', date: 'October 25, 2023', time: '12:15 PM'),
  ];

  // Function to cancel a booking
  void cancelBooking(int bookingId) {
    // Add your logic here to cancel the booking with the given ID
    // For example, remove it from the list
    setState(() {
      activeBookings.removeWhere((booking) => booking.id == bookingId);
    });
  }

  // Function to edit a booking
  void editBooking(int bookingId) {
    // Add your logic here to edit the booking with the given ID
    // For example, navigate to an edit page with the booking details
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Bookings'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: activeBookings.length,
        itemBuilder: (context, index) {
          final booking = activeBookings[index];
          return ListTile(
            title: Text('Booking ${booking.id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${booking.date}'),
                Text('Time: ${booking.time}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit), // Edit button
                  onPressed: () {
                    editBooking(booking.id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cancel), // Cancel button
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Cancel Booking'),
                          content: Text('Are you sure you want to cancel this booking?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                cancelBooking(booking.id);
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Booking {
  final int id;
  final String title;
  final String date;
  final String time;

  Booking({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
  });
}
