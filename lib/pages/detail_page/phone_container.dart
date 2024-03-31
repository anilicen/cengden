import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/pages/detail_page/item_details.controller.dart';
import 'package:flutter/material.dart';

class PhoneDetailsContainer extends StatelessWidget {
  const PhoneDetailsContainer({
    Key? key,
    required this.size,
    required this.controller,
    required this.phone,
  }) : super(key: key);

  final Size size;
  final ItemDetailsController controller;
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(phone.image),
          ),
          Text('Title: ${phone.title}'),
          const SizedBox(height: 10),
          Text('Brand: ${phone.brand}'),
          const SizedBox(height: 10),
          Text('Model: ${phone.model}'),
          const SizedBox(height: 10),
          Text('Year: ${phone.year}'),
          const SizedBox(height: 10),
          Text('Operating System: ${phone.operatingSystem}'),
          const SizedBox(height: 10),
          Text('Processor: ${phone.processor}'),
          const SizedBox(height: 10),
          Text('RAM: ${phone.ram}'),
          const SizedBox(height: 10),
          Text('Storage: ${phone.storage}'),
          const SizedBox(height: 10),
          Text('Camera Specs: ${phone.cameraSpecs}'),
          const SizedBox(height: 10),
          Text('Batter Capacity: ${phone.batteryCapacity}'),
          const SizedBox(height: 10),
          Text('Price: ${phone.price}'),
          const SizedBox(height: 10),
          Text('Description: ${phone.description}'),
        ],
      ),
    );
  }
}
