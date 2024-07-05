import 'package:flutter/material.dart';
import 'package:vendor_app/models/service.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  final Function(Service) onSave;

  ServiceCard({required this.service, required this.onSave});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.service.name);
    _priceController = TextEditingController(text: widget.service.price.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Service Name'),
        ),
        subtitle: TextField(
          controller: _priceController,
          decoration: InputDecoration(labelText: 'Service Price'),
          keyboardType: TextInputType.number,
        ),
        trailing: IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            widget.onSave(Service(
              id: widget.service.id,
              name: _nameController.text,
              price: double.tryParse(_priceController.text) ?? widget.service.price,
            ));
          },
        ),
      ),
    );
  }
}
