import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/pages/main_page/main_controller.dart';
import 'package:flutter/material.dart';

class PhoneContainer extends StatelessWidget {
  const PhoneContainer({
    Key? key,
    required this.index,
    required this.controller,
    required this.phone,
  }) : super(key: key);

  final MainController controller;
  final int index;
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: ${phone.title}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "Brand: ${phone.brand}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Model : ${phone.model}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Year : ${phone.year}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: €${phone.price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Storage: ${phone.storage}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Processor : ${phone.processor}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "RAM : ${phone.ram}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Image.network(phone.image),
      ],
    );
  }
}

class ComputerContainer extends StatelessWidget {
  const ComputerContainer({
    Key? key,
    required this.index,
    required this.controller,
    required this.computer,
  }) : super(key: key);

  final MainController controller;
  final int index;
  final Computer computer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: ${computer.title}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "Brand: ${computer.brand}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Model : ${computer.model}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Year : ${computer.year}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: ${computer.price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Graphics Card:${computer.graphicsCard}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Processor : ${computer.processor}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "RAM : ${computer.ram}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Image.network(computer.image),
      ],
    );
  }
}

class VehicleContainer extends StatelessWidget {
  const VehicleContainer({
    Key? key,
    required this.index,
    required this.controller,
    required this.vehicle,
  }) : super(key: key);

  final MainController controller;
  final int index;
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: ${vehicle.title}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "Brand: ${vehicle.brand}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Model : ${vehicle.model}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Year : ${vehicle.year}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: €${vehicle.price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Color: ${vehicle.color}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Engine Displacement : ${vehicle.engineDisplacement}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Fuel Type : ${vehicle.fuelType}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Image.network(
          vehicle.image,
        ),
      ],
    );
  }
}

class PrivateLessonContainer extends StatelessWidget {
  const PrivateLessonContainer({
    Key? key,
    required this.index,
    required this.controller,
    required this.privateLesson,
  }) : super(key: key);

  final MainController controller;
  final int index;
  final PrivateLesson privateLesson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: ${privateLesson.title}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "Tutor Name: ${privateLesson.tutorName}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Model : ${privateLesson.location}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
              Text(
                "Year : ${privateLesson.duration}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: €${privateLesson.price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Lessons: ${privateLesson.lessons.join(', ')}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Text(
                  "Description : ${privateLesson.description}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Image.network(privateLesson.image),
      ],
    );
  }
}
