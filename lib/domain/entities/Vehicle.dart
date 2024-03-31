import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';

class Vehicle extends Item {
  final String itemType = "Vehicle";
  final String id;
  final String title;
  final String type;
  final String brand;
  final String model;
  final String year;
  final String color;
  final String engineDisplacement;
  final String fuelType;
  final String transmissionType;
  final String mileage;
  final String price;
  final String image;
  final String description;
  final User createdBy;
  final String? batteryCapacity;
  final String? range;
  final String? bedCapacity;
  final String? waterCapacity;
  final String? payloadCapacity;

  Vehicle({
    required this.id,
    required this.title,
    required this.type,
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.engineDisplacement,
    required this.fuelType,
    required this.transmissionType,
    required this.mileage,
    required this.price,
    required this.image,
    required this.description,
    required this.createdBy,
    this.batteryCapacity,
    this.range,
    this.bedCapacity,
    this.waterCapacity,
    this.payloadCapacity,
  });
  Map<String, dynamic> toJson() {
    return {
      'itemType': itemType,
      'title': title,
      'type': type,
      'brand': brand,
      'model': model,
      'year': year,
      'color': color,
      'engineDisplacement': engineDisplacement,
      'fuelType': fuelType,
      'transmissionType': transmissionType,
      'mileage': mileage,
      'price': price,
      'image': image,
      'description': description,
      'createdBy': createdBy.toJson(),
      'batteryCapacity': batteryCapacity,
      'range': range,
      'bedCapacity': bedCapacity,
      'waterCapacity': waterCapacity,
      'payloadCapacity': payloadCapacity,
    };
  }

  Vehicle.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        title = json['title'],
        type = json['type'],
        brand = json['brand'],
        model = json['model'],
        year = json['year'],
        color = json['color'],
        engineDisplacement = json['engineDisplacement'],
        fuelType = json['fuelType'],
        transmissionType = json['transmissionType'],
        mileage = json['mileage'],
        price = json['price'],
        image = json['image'],
        description = json['description'],
        createdBy = User.fromJson(json['createdBy']),
        batteryCapacity = json['batteryCapacity'],
        bedCapacity = json['bedCapacity'],
        waterCapacity = json['waterCapacity'],
        payloadCapacity = json['payloadCapacity'],
        range = json['range'];

  Vehicle copyWith({
    String? id,
    String? title,
    String? type,
    String? brand,
    String? model,
    String? year,
    String? color,
    String? engineDisplacement,
    String? fuelType,
    String? transmissionType,
    String? mileage,
    String? price,
    String? image,
    String? description,
  }) {
    return Vehicle(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      color: color ?? this.color,
      engineDisplacement: engineDisplacement ?? this.engineDisplacement,
      fuelType: fuelType ?? this.fuelType,
      transmissionType: transmissionType ?? this.transmissionType,
      mileage: mileage ?? this.mileage,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      createdBy: createdBy,
      waterCapacity: waterCapacity,
      bedCapacity: bedCapacity,
      batteryCapacity: batteryCapacity,
      payloadCapacity: payloadCapacity,
      range: range,
    );
  }
}
