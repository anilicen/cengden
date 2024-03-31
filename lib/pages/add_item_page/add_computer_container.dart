import 'package:cengden/pages/add_item_page/add_item_controller.dart';
import 'package:cengden/pages/update_item_page/update_item_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddComputerContainer extends StatelessWidget {
  AddComputerContainer({
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
            controller.computer = controller.computer.copyWith(title: value);
          },
          text: isUpdate != null ? controller!.computer.title : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Type",
          hintText: "Type",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(type: value);
          },
          text: isUpdate != null ? controller!.computer.type : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Brand",
          hintText: "Brand",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(brand: value);
          },
          text: isUpdate != null ? controller!.computer.brand : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Model",
          hintText: "Model",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(model: value);
          },
          text: isUpdate != null ? controller!.computer.model : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Year",
          hintText: "Year",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(year: value);
          },
          text: isUpdate != null ? controller!.computer.year : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Operating System",
          hintText: "Operating System",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(operatingSystem: value);
          },
          text: isUpdate != null ? controller!.computer.operatingSystem : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Processor",
          hintText: "Processor",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(processor: value);
          },
          text: isUpdate != null ? controller!.computer.processor : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "RAM",
          hintText: "RAM",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(ram: value);
          },
          text: isUpdate != null ? controller!.computer.ram : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "HDD",
          hintText: "HDD",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(storage: {"HDD": value});
          },
          text: isUpdate != null ? controller!.computer.storage['HDD'] ?? "" : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "SSD",
          hintText: "SSD",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(storage: {"SSD": value});
          },
          text: isUpdate != null ? controller!.computer.storage['SSD'] ?? "" : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Graphics Card",
          hintText: "Graphics Card",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(graphicsCard: value);
          },
          text: isUpdate != null ? controller!.computer.graphicsCard : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Price",
          hintText: "Price",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(price: value);
          },
          text: isUpdate != null ? controller!.computer.price : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Image path",
          hintText: "Image path",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(image: value);
          },
          text: isUpdate != null ? controller!.computer.image : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Description",
          hintText: "Description",
          isObscure: false,
          onChanged: (value) {
            controller.computer = controller.computer.copyWith(description: value);
          },
          text: isUpdate != null ? controller!.computer.description : "",
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: isUpdate != null ? "Update Computer" : "Add Computer",
          isEnabled: true,
          onPressed: () => controller.addComputer(context),
        ),
      ],
    );
  }
}
