import 'package:cengden/domain/entities/Item.dart';

class Phone extends Item {
  final String itemType = "Phone";
  final String id;
  final String title;
  final String brand;
  final String model;
  final String year;
  final String operatingSystem;
  final String processor;
  final String ram;
  final String storage;
  final Map<String, String> cameraSpecs; // Changed type to Map<String, String>
  final String batteryCapacity;
  final String price;
  final String image;
  final String description;

  Phone({
    required this.id,
    required this.title,
    required this.brand,
    required this.model,
    required this.year,
    required this.operatingSystem,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.cameraSpecs, // Adjusted type to Map<String, String>
    required this.batteryCapacity,
    required this.price,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemType': itemType,
      'title': title,
      'brand': brand,
      'model': model,
      'year': year,
      'operatingSystem': operatingSystem,
      'processor': processor,
      'ram': ram,
      'storage': storage,
      'cameraSpecs': cameraSpecs, // No need to join or split, as it's already a Map<String, String>
      'batteryCapacity': batteryCapacity,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  Phone.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        brand = json['brand'],
        model = json['model'],
        year = json['year'],
        operatingSystem = json['operatingSystem'],
        processor = json['processor'],
        ram = json['ram'],
        storage = json['storage'],
        cameraSpecs = Map<String, String>.from(json['cameraSpecs']), // Convert JSON to Map<String, String>
        batteryCapacity = json['batteryCapacity'],
        price = json['price'],
        image = json['image'],
        description = json['description'];
}
