import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';

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
  final User createdBy;

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
    required this.createdBy,
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
      'createdBy': createdBy.toJson(),
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
        description = json['description'],
        createdBy = User.fromJson(json['createdBy']);

  Computer copyWith({
    String? id,
    String? title,
    String? type,
    String? brand,
    String? model,
    String? year,
    String? processor,
    String? ram,
    Map<String, String>? storage,
    String? graphicsCard,
    String? operatingSystem,
    String? price,
    String? image,
    String? description,
  }) {
    return Computer(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      processor: processor ?? this.processor,
      ram: ram ?? this.ram,
      storage: storage != null ? {...this.storage, ...storage} : this.storage,
      graphicsCard: graphicsCard ?? this.graphicsCard,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      createdBy: createdBy,
    );
  }
}
