import 'package:cengden/domain/entities/Item.dart';

class PrivateLesson extends Item {
  final String itemType = "PrivateLesson";
  final String id;
  final String title;
  final String tutorName;
  final List<String> lessons; // Changed type to List<String>
  final String location;
  final String duration;
  final String price;
  final String image;
  final String description;

  PrivateLesson({
    required this.id,
    required this.title,
    required this.tutorName,
    required this.lessons,
    required this.location,
    required this.duration,
    required this.price,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemType': itemType,
      'title': title,
      'tutorName': tutorName,
      'lessons': lessons.join(', '), // Convert list to comma-separated string
      'location': location,
      'duration': duration,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  PrivateLesson.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        tutorName = json['tutorName'],
        lessons = (json['lessons'] as String).split(', '), // Convert string to list
        location = json['location'],
        duration = json['duration'],
        price = json['price'],
        image = json['image'],
        description = json['description'];
}
