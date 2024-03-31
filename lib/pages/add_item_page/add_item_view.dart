import 'package:cengden/data/repositories/item_repository.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/add_item_page/add_computer_container.dart';
import 'package:cengden/pages/add_item_page/add_item_controller.dart';
import 'package:cengden/pages/add_item_page/add_phone_container.dart';
import 'package:cengden/pages/add_item_page/add_priv_lesson_container.dart';
import 'package:cengden/pages/add_item_page/add_vehicle_container.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// ignore: must_be_immutable
class AddItemView extends View {
  User user;
  AddItemView(this.user);
  State<StatefulWidget> createState() {
    return _AddItemViewState(
      AddItemController(
        DataItemRepository(),
        user,
      ),
    );
  }
}

class _AddItemViewState extends ViewState<AddItemView, AddItemController> {
  _AddItemViewState(AddItemController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        child: ControlledWidgetBuilder<AddItemController>(
          builder: (context, controller) {
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => controller.setTypeAsPhone(),
                      child: const Text("Add Phone"),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => controller.setTypeAsComputer(),
                      child: const Text("Add Computer"),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => controller.setTypeAsVehicle(),
                      child: const Text("Add Vehicle"),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => controller.setTypeAsPrivateLesson(),
                      child: const Text("Add Private Lesson"),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 70,
                  color: const Color(0xff17cda0),
                  child: Text(
                    "CENGDEN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 50,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 25,
                  color: const Color(0xff17cda0).withOpacity(0.5),
                  child: Text(
                    "Item Details Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: size.width / 3,
                    child: controller.selectedType == "Phone"
                        ? AddPhoneContainer(size: size, cont: controller)
                        : controller.selectedType == "Computer"
                            ? AddComputerContainer(size: size, cont: controller)
                            : controller.selectedType == "Vehicle"
                                ? AddVehicleContainer(size: size, cont: controller)
                                : AddPrivateLessonContainer(size: size, cont: controller),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
