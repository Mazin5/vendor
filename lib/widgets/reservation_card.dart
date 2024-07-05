import 'package:flutter/material.dart';
import 'package:vendor_app/models/reservation.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(reservation.userName),
        subtitle: Text('${reservation.service} on ${reservation.date}'),
      ),
    );
  }
}
