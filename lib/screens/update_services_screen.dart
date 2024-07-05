import 'package:flutter/material.dart';
import 'package:vendor_app/models/service.dart';
import 'package:vendor_app/services/api_service.dart';
import 'package:vendor_app/widgets/service_card.dart';

class UpdateServicesScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Services'),
      ),
      body: FutureBuilder<List<Service>>(
        future: apiService.fetchServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching services'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No services found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ServiceCard(service: snapshot.data![index], onSave: (updatedService) {
                  apiService.updateService(updatedService);
                });
              },
            );
          }
        },
      ),
    );
  }
}
