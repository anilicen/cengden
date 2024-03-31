import 'package:cengden/data/repositories/item_repository.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/pages/add_item_page/add_computer_container.dart';
import 'package:cengden/pages/add_item_page/add_phone_container.dart';
import 'package:cengden/pages/add_item_page/add_priv_lesson_container.dart';
import 'package:cengden/pages/add_item_page/add_vehicle_container.dart';
import 'package:cengden/pages/update_item_page/update_item_controller.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// ignore: must_be_immutable
class UpdateItemView extends View {
  User user;
  Item item;
  UpdateItemView(this.user, this.item);
  State<StatefulWidget> createState() {
    return _UpdateItemViewState(
      UpdateItemController(
        DataItemRepository(),
        user,
        item,
      ),
    );
  }
}

class _UpdateItemViewState extends ViewState<UpdateItemView, UpdateItemController> {
  _UpdateItemViewState(UpdateItemController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        child: ControlledWidgetBuilder<UpdateItemController>(
          builder: (context, controller) {
            return Column(
              children: [
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
                    "Update Item Page",
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
                    child: controller.selectedType == null
                        ? SizedBox()
                        : controller.selectedType == "Phone"
                            ? AddPhoneContainer(
                                size: size,
                                cont: controller,
                                isUpdate: true,
                              )
                            : controller.selectedType == "Computer"
                                ? AddComputerContainer(
                                    size: size,
                                    cont: controller,
                                    isUpdate: true,
                                  )
                                : controller.selectedType == "Vehicle"
                                    ? AddVehicleContainer(
                                        size: size,
                                        cont: controller,
                                        isUpdate: true,
                                      )
                                    : AddPrivateLessonContainer(
                                        size: size,
                                        cont: controller,
                                        isUpdate: true,
                                      ),
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
