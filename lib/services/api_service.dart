import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/models/reservation.dart';

import '../models/service.dart';

class ApiService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Reservation>> fetchReservations() async {
    QuerySnapshot querySnapshot = await _db.collection('reservations').get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Reservation.fromJson(data);
    }).toList();
  }

  Future<void> updateService(Service service) async {
    await _db.collection('services').doc(service.id).update(service.toJson());
  }

  Future<List<Service>> fetchServices() async {
    QuerySnapshot querySnapshot = await _db.collection('services').get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Service.fromJson(data);
    }).toList();
  }
}
