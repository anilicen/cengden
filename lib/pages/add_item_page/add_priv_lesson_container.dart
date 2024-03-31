import 'package:cengden/pages/add_item_page/add_item_controller.dart';
import 'package:cengden/pages/update_item_page/update_item_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPrivateLessonContainer extends StatelessWidget {
  AddPrivateLessonContainer({
    Key? key,
    required this.size,
    this.cont,
    this.isUpdate,
  }) : super(key: key);

  final Size size;
  final Controller? cont;
  final bool? isUpdate;
  @override
  Widget build(BuildContext context) {
    final controller;
    if (isUpdate != null) {
      controller = cont as UpdateItemController;
    } else {
      controller = cont as AddItemController;
    }
    return ListView(
      children: [
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Title",
          hintText: "Title",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(title: value);
          },
          text: isUpdate != null ? controller!.privateLesson.title : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Tutor Name",
          hintText: "Tutor Name",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(tutorName: value);
          },
          text: isUpdate != null ? controller!.privateLesson.tutorName : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Lessons",
          hintText: "Lessons",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson =
                controller.privateLesson.copyWith(lessons: value.contains(',') ? value.split(',') : [value]);
          },
          text: isUpdate != null ? controller!.privateLesson.lessons.join(', ') : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Location",
          hintText: "Location",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(location: value);
          },
          text: isUpdate != null ? controller!.privateLesson.location : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Duration",
          hintText: "Duration",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(duration: value);
          },
          text: isUpdate != null ? controller!.privateLesson.duration : "",
        ),
        CengdenTextField(
          size: size,
          title: "Price",
          hintText: "Price",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(price: value);
          },
          text: isUpdate != null ? controller!.privateLesson.price : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Image path",
          hintText: "Image path",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(image: value);
          },
          text: isUpdate != null ? controller!.privateLesson.image : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Description",
          hintText: "Description",
          isObscure: false,
          onChanged: (value) {
            controller.privateLesson = controller.privateLesson.copyWith(description: value);
          },
          text: isUpdate != null ? controller!.privateLesson.description : "",
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: isUpdate != null ? "Update private Lesson" : "Add privateLesson",
          isEnabled: true,
          onPressed: () =>
              isUpdate != null ? controller.updatePrivateLesson(context) : controller.addPrivateLesson(context),
        ),
      ],
    );
  }
}
