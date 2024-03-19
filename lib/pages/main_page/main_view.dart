import 'package:cengden/data/repositories/item_repository.dart';
import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/helpers/request_helper.dart';
import 'package:cengden/pages/main_page/item_containers.dart';
import 'package:cengden/pages/main_page/main_controller.dart';
import 'package:cengden/widgets/primary_button.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class MainView extends View {
  MainView();

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _MainViewState(
      MainController(
        DataItemRepository(),
      ),
    );
  }
}

class _MainViewState extends ViewState<MainView, MainController> {
  _MainViewState(MainController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ControlledWidgetBuilder<MainController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.showPhones(),
                        child: const Text("Show Phones"),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.showVehicles(),
                        child: const Text("Show Vehicles"),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.showComputers(),
                        child: const Text("Show Computers"),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.showPrivateLessons(),
                        child: const Text("Show Private Lessons"),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => controller.showAllItems(),
                        child: const Text("Show All Items"),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 70,
                    color: Colors.black.withOpacity(0.1),
                    child: Text(
                      "CENGDEN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 50,
                      ),
                    ),
                  ),
                  controller.itemList != null
                      ? Expanded(
                          child: ListView(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            children: [
                              for (int index = 0; index < 10; index++)
                                Column(
                                  children: [
                                    controller.itemList!.length > (controller.pageNumber * 10) + index
                                        ? Container(
                                            height: 150,
                                            width: size.width * 0.8,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: _buildSwitchCase(controller, (controller.pageNumber * 10) + index),
                                          )
                                        : const SizedBox(),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  controller.itemList == null
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            controller.pageNumber <= 0
                                ? const SizedBox(width: 186)
                                : PrimaryButton(
                                    text: "< PREV",
                                    onPressed: () => controller.goToPrevPage(),
                                  ),
                            Text("Page Number: ${controller.pageNumber + 1}"),
                            controller.itemList!.length < (controller.pageNumber + 1) * 10
                                ? const SizedBox(width: 186)
                                : PrimaryButton(
                                    text: "NEXT > ",
                                    onPressed: () => controller.goToNextPage(),
                                  ),
                          ],
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchCase(MainController controller, int index) {
    switch (controller.itemList![index].itemType) {
      case "Phone":
        return PhoneContainer(
          index: index,
          phone: controller.itemList![index] as Phone,
          controller: controller,
        );
      case "Computer":
        return ComputerContainer(
          index: index,
          computer: controller.itemList![index] as Computer,
          controller: controller,
        );
      case "Vehicle":
        return VehicleContainer(
          index: index,
          vehicle: controller.itemList![index] as Vehicle,
          controller: controller,
        );
      case "PrivateLesson":
        return PrivateLessonContainer(
          index: index,
          privateLesson: controller.itemList![index] as PrivateLesson,
          controller: controller,
        );
      default:
        return const SizedBox(); // Handle default case if needed
    }
  }
}
