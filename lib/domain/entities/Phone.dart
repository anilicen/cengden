import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';

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
  final User createdBy;

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
    required this.createdBy,
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
      'createdBy': createdBy.toJson()
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
        description = json['description'],
        createdBy = User.fromJson(json['createdBy']);
  Phone copyWith({
    String? id,
    String? title,
    String? brand,
    String? model,
    String? year,
    String? operatingSystem,
    String? processor,
    String? ram,
    String? storage,
    Map<String, String>? cameraSpecs,
    String? batteryCapacity,
    String? price,
    String? image,
    String? description,
  }) {
    return Phone(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      processor: processor ?? this.processor,
      ram: ram ?? this.ram,
      storage: storage ?? this.storage,
      cameraSpecs: cameraSpecs != null ? {...this.cameraSpecs, ...cameraSpecs} : this.cameraSpecs,
      batteryCapacity: batteryCapacity ?? this.batteryCapacity,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      createdBy: createdBy,
    );
  }
}
