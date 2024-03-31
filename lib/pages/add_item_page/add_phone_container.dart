import 'package:cengden/pages/add_item_page/add_item_controller.dart';
import 'package:cengden/pages/update_item_page/update_item_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPhoneContainer extends StatelessWidget {
  AddPhoneContainer({
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
            controller!.phone = controller!.phone.copyWith(title: value);
          },
          text: isUpdate != null ? controller!.phone.title : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Brand",
          hintText: "Brand",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(brand: value);
          },
          text: isUpdate != null ? controller!.phone.brand : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Model",
          hintText: "Model",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(model: value);
          },
          text: isUpdate != null ? controller!.phone.model : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Year",
          hintText: "Year",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(year: value);
          },
          text: isUpdate != null ? controller!.phone.year : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Operating System",
          hintText: "Operating System",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(operatingSystem: value);
          },
          text: isUpdate != null ? controller!.phone.operatingSystem : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Processor",
          hintText: "Processor",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(processor: value);
          },
          text: isUpdate != null ? controller!.phone.processor : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "RAM",
          hintText: "RAM",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(ram: value);
          },
          text: isUpdate != null ? controller!.phone.ram : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Storage",
          hintText: "Storage",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(storage: value);
          },
          text: isUpdate != null ? controller!.phone.storage : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Rear Camera",
          hintText: "Rear Camera",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(cameraSpecs: {"Rear Camera": value});
          },
          text: isUpdate != null ? controller!.phone.cameraSpecs['Rear Camera'] ?? "" : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Front Camera",
          hintText: "Front Camera",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(cameraSpecs: {"Front Camera": value});
          },
          text: isUpdate != null ? controller!.phone.cameraSpecs['Front camera'] ?? "" : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Additional Camera",
          hintText: "Additional Camera",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(cameraSpecs: {"Additional Camera": value});
          },
          text: isUpdate != null ? controller!.phone.cameraSpecs['Additional Camera'] ?? "" : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Battery Capacity",
          hintText: "Battery Capacity",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(batteryCapacity: value);
          },
          text: isUpdate != null ? controller!.phone.batteryCapacity : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Price",
          hintText: "Price",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(price: value);
          },
          text: isUpdate != null ? controller!.phone.price : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Image path",
          hintText: "Image path",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(image: value);
          },
          text: isUpdate != null ? controller!.phone.image : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Description",
          hintText: "Description",
          isObscure: false,
          onChanged: (value) {
            controller!.phone = controller!.phone.copyWith(description: value);
          },
          text: isUpdate != null ? controller!.phone.description : "",
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: isUpdate != null ? "Update Phone" : "Add Phone",
          isEnabled: true,
          onPressed: () => isUpdate != null ? controller.updatePhone(context) : controller!.addPhone(context),
        ),
      ],
    );
  }
}
