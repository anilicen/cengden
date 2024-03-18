import 'package:cengden/entities/Item.dart';

class Computer extends Item {
  final String itemType = "Computer";
  final String id;
  final String title;
  final String type;
  final String brand;
  final String model;
  final String year;
  final String processor;
  final String ram;
  final Map<String, String> storage; // Changed type to Map<String, String>
  final String graphicsCard;
  final String operatingSystem;
  final String price;
  final String image;
  final String description;

  Computer({
    required this.id,
    required this.title,
    required this.type,
    required this.brand,
    required this.model,
    required this.year,
    required this.processor,
    required this.ram,
    required this.storage, // Adjusted type to Map<String, String>
    required this.graphicsCard,
    required this.operatingSystem,
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
      'processor': processor,
      'ram': ram,
      'storage': storage,
      'graphicsCard': graphicsCard,
      'operatingSystem': operatingSystem,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  Computer.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        type = json['type'],
        brand = json['brand'],
        model = json['model'],
        year = json['year'],
        processor = json['processor'],
        ram = json['ram'],
        storage = Map<String, String>.from(json['storage']), // Convert JSON to Map<String, String>
        graphicsCard = json['graphicsCard'],
        operatingSystem = json['operatingSystem'],
        price = json['price'],
        image = json['image'],
        description = json['description'];
}
