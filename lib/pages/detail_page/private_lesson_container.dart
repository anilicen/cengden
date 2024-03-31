import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/pages/detail_page/item_details.controller.dart';
import 'package:flutter/material.dart';

class PrivateLessonDetailsContainer extends StatelessWidget {
  const PrivateLessonDetailsContainer({
    Key? key,
    required this.size,
    required this.controller,
    required this.privateLesson,
  }) : super(key: key);

  final Size size;
  final ItemDetailsController controller;
  final PrivateLesson privateLesson;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(privateLesson.image),
          ),
          Text('Title: ${privateLesson.title}'),
          const SizedBox(height: 10),
          Text('Tutor Name: ${privateLesson.tutorName}'),
          const SizedBox(height: 10),
          Text('Lessons: ${privateLesson.lessons.join(', ')}'),
          const SizedBox(height: 10),
          Text('Location: ${privateLesson.location}'),
          const SizedBox(height: 10),
          Text('Duration: ${privateLesson.duration}'),
          const SizedBox(height: 10),
          Text('Price: ${privateLesson.price}'),
          const SizedBox(height: 10),
          Text('Description: ${privateLesson.description}'),
        ],
      ),
    );
  }
}
