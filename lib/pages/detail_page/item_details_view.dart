import 'package:cengden/constants.dart';
import 'package:cengden/data/repositories/item_repository.dart';
import 'package:cengden/data/repositories/user_repository.dart';
import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/pages/detail_page/computer_container.dart';
import 'package:cengden/pages/detail_page/item_details.controller.dart';
import 'package:cengden/pages/detail_page/phone_container.dart';
import 'package:cengden/pages/detail_page/private_lesson_container.dart';
import 'package:cengden/pages/detail_page/vehicle_container.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ItemDetailsView extends View {
  ItemDetailsView(this.item, this.user);
  final Item item;
  final User user;
  @override
  State<StatefulWidget> createState() {
    return _ItemDetailsViewState(
      ItemDetailsController(
        DataItemRepository(),
        DataUserRepository(),
        item,
        user,
      ),
    );
  }
}

class _ItemDetailsViewState extends ViewState<ItemDetailsView, ItemDetailsController> {
  _ItemDetailsViewState(ItemDetailsController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffd6faf1),
      body: SizedBox(
        child: ControlledWidgetBuilder<ItemDetailsController>(
          builder: (context, controller) {
            return Column(
              children: [
                controller.isOwner || controller.user.userType == UserType.ADMIN
                    ? Row(
                        children: [
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () => controller.updateItem(context),
                            child: const Text("Update Item"),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () => controller.deleteItem(context),
                            child: const Text("Delete Item"),
                          ),
                        ],
                      )
                    : const SizedBox(),
                controller.user.userType != UserType.REGULAR &&
                        !controller.user.favoriteItemList.contains(controller.id)
                    ? Row(
                        children: [
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () => controller.addToFavorites(),
                            child: const Text("Add To Favorites"),
                          ),
                        ],
                      )
                    : SizedBox(),
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
                controller.item.itemType == "Phone"
                    ? PhoneDetailsContainer(size: size, controller: controller, phone: controller.item as Phone)
                    : controller.item.itemType == "Computer"
                        ? ComputerDetailsContainer(
                            size: size, controller: controller, computer: controller.item as Computer)
                        : controller.item.itemType == "Vehicle"
                            ? VehicleDetailsContainer(
                                size: size, controller: controller, vehicle: controller.item as Vehicle)
                            : PrivateLessonDetailsContainer(
                                size: size, controller: controller, privateLesson: controller.item as PrivateLesson),
              ],
            );
          },
        ),
      ),
    );
  }
}
