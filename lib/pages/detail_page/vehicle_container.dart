import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/pages/detail_page/item_details.controller.dart';
import 'package:flutter/material.dart';

class VehicleDetailsContainer extends StatelessWidget {
  const VehicleDetailsContainer({
    Key? key,
    required this.size,
    required this.controller,
    required this.vehicle,
  }) : super(key: key);

  final Size size;
  final ItemDetailsController controller;
  final Vehicle vehicle;

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
            child: Image.network(vehicle.image),
          ),
          Text('Title: ${vehicle.title}'),
          const SizedBox(height: 10),
          Text('Type: ${vehicle.type}'),
          const SizedBox(height: 10),
          Text('Brand: ${vehicle.brand}'),
          const SizedBox(height: 10),
          Text('Model: ${vehicle.model}'),
          const SizedBox(height: 10),
          Text('Year: ${vehicle.year}'),
          const SizedBox(height: 10),
          Text('Color: ${vehicle.color}'),
          const SizedBox(height: 10),
          Text('Engine Displacement: ${vehicle.engineDisplacement}'),
          const SizedBox(height: 10),
          Text('Fuel type: ${vehicle.fuelType}'),
          const SizedBox(height: 10),
          Text('Transmission Type: ${vehicle.transmissionType}'),
          const SizedBox(height: 10),
          Text('Mileage: ${vehicle.mileage}'),
          const SizedBox(height: 10),
          Text('Price: ${vehicle.price}'),
          const SizedBox(height: 10),
          Text('Description: ${vehicle.description}'),
          vehicle.batteryCapacity != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Battery Capacity: ${vehicle.batteryCapacity}'),
                  ],
                )
              : SizedBox(),
          vehicle.range != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Range: ${vehicle.range}'),
                  ],
                )
              : SizedBox(),
          vehicle.waterCapacity != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Water Capacity: ${vehicle.waterCapacity}'),
                  ],
                )
              : SizedBox(),
          vehicle.payloadCapacity != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Payload Capacity: ${vehicle.payloadCapacity}'),
                  ],
                )
              : SizedBox(),
          vehicle.bedCapacity != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Bed Capacity: ${vehicle.bedCapacity}'),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
