import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/pages/detail_page/item_details.controller.dart';
import 'package:flutter/material.dart';

class ComputerDetailsContainer extends StatelessWidget {
  const ComputerDetailsContainer({
    Key? key,
    required this.size,
    required this.controller,
    required this.computer,
  }) : super(key: key);

  final Size size;
  final ItemDetailsController controller;
  final Computer computer;

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
            child: Image.network(computer.image),
          ),
          Text('Title: ${computer.title}'),
          const SizedBox(height: 10),
          Text('Type: ${computer.type}'),
          const SizedBox(height: 10),
          Text('Brand: ${computer.brand}'),
          const SizedBox(height: 10),
          Text('Model: ${computer.model}'),
          const SizedBox(height: 10),
          Text('Year: ${computer.year}'),
          const SizedBox(height: 10),
          Text('Processor: ${computer.processor}'),
          const SizedBox(height: 10),
          Text('Operating System: ${computer.operatingSystem}'),
          const SizedBox(height: 10),
          Text('RAM: ${computer.ram}'),
          const SizedBox(height: 10),
          Text('Storage: ${computer.storage}'),
          const SizedBox(height: 10),
          Text('Graphics Card: ${computer.graphicsCard}'),
          const SizedBox(height: 10),
          Text('Price: ${computer.price}'),
          const SizedBox(height: 10),
          Text('Description: ${computer.description}'),
        ],
      ),
    );
  }
}
