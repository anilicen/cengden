import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';

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
  final User createdBy;

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
    required this.createdBy,
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
      'createdBy': createdBy.toJson(),
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
        description = json['description'],
        createdBy = User.fromJson(json['createdBy']);

  PrivateLesson copyWith({
    String? id,
    String? title,
    String? tutorName,
    List<String>? lessons,
    String? location,
    String? duration,
    String? price,
    String? image,
    String? description,
  }) {
    return PrivateLesson(
      id: id ?? this.id,
      title: title ?? this.title,
      tutorName: tutorName ?? this.tutorName,
      lessons: lessons ?? this.lessons,
      location: location ?? this.location,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      createdBy: createdBy,
    );
  }
}
