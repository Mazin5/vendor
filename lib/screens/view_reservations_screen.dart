import 'package:flutter/material.dart';
import 'package:vendor_app/models/reservation.dart';
import 'package:vendor_app/services/api_service.dart';
import 'package:vendor_app/widgets/reservation_card.dart';

class ViewReservationsScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Reservations'),
      ),
      body: FutureBuilder<List<Reservation>>(
        future: apiService.fetchReservations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching reservations'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No reservations found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ReservationCard(reservation: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
