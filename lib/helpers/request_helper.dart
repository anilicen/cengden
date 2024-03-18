import 'package:cengden/entities/Computer.dart';
import 'package:cengden/entities/Phone.dart';
import 'package:cengden/entities/PrivateLesson.dart';
import 'package:cengden/entities/Vehicle.dart';
import 'package:cengden/helpers/request.dart';

class RequestHelper {
  Vehicle vehicle = Vehicle(
    id: '0',
    title: 'Honda Civic 2018',
    type: 'Sedan',
    brand: 'Honda',
    model: 'Civic',
    year: '2018',
    color: 'White',
    engineDisplacement: '1.5L',
    fuelType: 'Petrol',
    transmissionType: 'CVT',
    mileage: '25,000 km',
    price: '\$12,500',
    image: 'image path',
    description: 'good condition Civic with low mileage',
  );

  Phone phone = Phone(
    id: '0',
    title: "iPhone 13 Pro Max",
    brand: "Apple",
    model: "13 Pro Max",
    year: "2021",
    operatingSystem: "iOS 15",
    processor: "Apple A15 Bionic",
    ram: "6 GB",
    storage: "512 GB",
    cameraSpecs: {"Main": "12MP", "Ultra Wide": "12MP", "Telephoto": "12MP"},
    batteryCapacity: "4352 mAh",
    price: "\$1,099",
    image: "image path",
    description: "Super iPhone offering from Apple with improved camera capabilities and long battery life.",
  );

  Computer computer = Computer(
    id: '0',
    title: "Apple MacBook Pro 16-inch",
    type: "Notebook",
    brand: "Apple",
    model: "MacBook Pro",
    year: "2021",
    processor: "Apple M1 Pro",
    ram: "16 GB",
    storage: {"SSD": "512 GB SSD", "HDD": "1 TB HDD"},
    graphicsCard: "Apple M1 Pro",
    operatingSystem: "macOS Monterey",
    price: "\$2,499",
    image: "image path",
    description: "Powerful MacBook Pro with stunning Retina display, perfect for creative professionals.",
  );

  PrivateLesson lesson = PrivateLesson(
    id: '0',
    title: "Programming Fundamentals Course",
    tutorName: "John Smith",
    lessons: ["Data Structures", "Algorithms", "C++"],
    location: "Online",
    duration: "1 hour/session",
    price: "\$60",
    image: "image path",
    description:
        "Comprehensive course covering programming fundamentals including Data Structures, Algorithms, and C++.",
  );

  void addItem() {
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
  }

  void getItems() {}
}
