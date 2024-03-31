import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/domain/repositories/item_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UpdateItemController extends Controller {
  UpdateItemController(ItemRepository itemRepository, User user, Item item)
      : _itemRepository = itemRepository,
        user = user,
        item = item;

  Item item;
  User user;
  late Phone phone;
  late Computer computer;
  late Vehicle vehicle;
  late PrivateLesson privateLesson;
  ItemRepository _itemRepository;
  String? selectedType;

  @override
  void onInitState() {
    selectedType = item.itemType;
    if (selectedType == "Phone") {
      phone = item as Phone;
    } else if (selectedType == "Computer") {
      computer = item as Computer;
    } else if (selectedType == "Vehicle") {
      vehicle = item as Vehicle;
    } else if (selectedType == "PrivateLesson") {
      privateLesson = item as PrivateLesson;
    }

    refreshUI();
  }

  Future<void> updatePhone(context) async {
    await _itemRepository.updateItem(phone.toJson(), phone.id);
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> updateComputer(context) async {
    await _itemRepository.updateItem(computer.toJson(), computer.id);
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> updateVehicle(context) async {
    await _itemRepository.updateItem(vehicle.toJson(), vehicle.id);
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> updatePrivateLesson(context) async {
    await _itemRepository.updateItem(privateLesson.toJson(), privateLesson.id);
    CengdenNavigator.navigateToMainView(context, user);
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  void xxx() {}
}
