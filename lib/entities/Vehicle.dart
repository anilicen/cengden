import 'package:cengden/entities/Item.dart';

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
        description = json['description'];
}
