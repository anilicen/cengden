import 'package:cengden/pages/add_item_page/add_item_controller.dart';
import 'package:cengden/pages/update_item_page/update_item_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:cengden/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddVehicleContainer extends StatelessWidget {
  AddVehicleContainer({
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
            controller.vehicle = controller.vehicle.copyWith(title: value);
          },
          text: isUpdate != null ? controller!.vehicle.title : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Type",
          hintText: "Type",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(type: value);
          },
          text: isUpdate != null ? controller!.vehicle.type : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Brand",
          hintText: "Brand",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(brand: value);
          },
          text: isUpdate != null ? controller!.vehicle.brand : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Model",
          hintText: "Model",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(model: value);
          },
          text: isUpdate != null ? controller!.vehicle.model : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Year",
          hintText: "Year",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(year: value);
          },
          text: isUpdate != null ? controller!.vehicle.year : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Color",
          hintText: "Color",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(color: value);
          },
          text: isUpdate != null ? controller!.vehicle.color : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Engine Displacement",
          hintText: "Engine Displacement",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(engineDisplacement: value);
          },
          text: isUpdate != null ? controller!.vehicle.engineDisplacement : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Fuel Type",
          hintText: "Fuel Type",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(fuelType: value);
          },
          text: isUpdate != null ? controller!.vehicle.fuelType : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Transmission Type:",
          hintText: "Transmission Type:",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(transmissionType: value);
          },
          text: isUpdate != null ? controller!.vehicle.transmissionType : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Mileage:",
          hintText: "Mileage:",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(mileage: value);
          },
          text: isUpdate != null ? controller!.vehicle.mileage : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Price",
          hintText: "Price",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(price: value);
          },
          text: isUpdate != null ? controller!.vehicle.price : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Image path",
          hintText: "Image path",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(image: value);
          },
          text: isUpdate != null ? controller!.vehicle.image : "",
        ),
        const SizedBox(height: 10),
        CengdenTextField(
          size: size,
          title: "Description",
          hintText: "Description",
          isObscure: false,
          onChanged: (value) {
            controller.vehicle = controller.vehicle.copyWith(description: value);
          },
          text: isUpdate != null ? controller!.vehicle.description : "",
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: isUpdate != null ? "Update Vehicle" : "Add Vehicle",
          isEnabled: true,
          onPressed: () => isUpdate != null ? controller.updateVehicle(context) : controller.addComputer(context),
        ),
      ],
    );
  }
}
