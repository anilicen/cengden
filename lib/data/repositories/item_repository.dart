import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/domain/repositories/item_repository.dart';
import 'package:cengden/helpers/request.dart';

class DataItemRepository implements ItemRepository {
  List<Item> itemList = [];

  List<Phone> phoneList = [];
  List<Computer> computerList = [];
  List<Vehicle> vehicleList = [];
  List<PrivateLesson> privateLessonList = [];

  List<bool> isTokenAcquired = [false];

  @override
  List<Item> getItemList() {
    return itemList;
  }

  @override
  List<Phone> getPhoneList() {
    return phoneList;
  }

  @override
  List<Computer> getComputerList() {
    return computerList;
  }

  @override
  List<Vehicle> getVehicleList() {
    return vehicleList;
  }

  @override
  List<PrivateLesson> getPrivateLessonList() {
    return privateLessonList;
  }

  @override
  Future<void> getItems(int skip) async {
    if (!isTokenAcquired[0]) await Request.sendPostRequest(isTokenAcquired);
    await Request.getItems(itemList, phoneList, vehicleList, computerList, privateLessonList, skip);
  }

  @override
  Future<void> getPhoneItems(int skip, int limit) async {
    await Request.getPhoneItems(phoneList, skip, limit);
  }

  @override
  Future<void> getComputerItems(int skip, int limit) async {
    await Request.getComputerItems(computerList, skip, limit);
  }

  @override
  Future<void> getPrivateLessonItems(int skip, int limit) async {
    await Request.getPrivateLessonItems(privateLessonList, skip, limit);
  }

  @override
  Future<void> getVehicleItems(int skip, int limit) async {
    await Request.getVehicleItems(vehicleList, skip, limit);
  }
}
