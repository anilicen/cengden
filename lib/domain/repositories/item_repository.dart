import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/Vehicle.dart';

abstract class ItemRepository {
  List<Item> getItemList();
  List<Phone> getPhoneList();
  List<Vehicle> getVehicleList();
  List<Computer> getComputerList();
  List<PrivateLesson> getPrivateLessonList();
  Future<void> updateItem(Map<String, dynamic> json, String id);
  Future<void> deleteItem(String id);
  Future<void> addItem(Map<String, dynamic> json);
  Future<void> getItems(int skip);
  Future<void> getPhoneItems(int skip, int limit);
  Future<void> getVehicleItems(int skip, int limit);
  Future<void> getComputerItems(int skip, int limit);
  Future<void> getPrivateLessonItems(int skip, int limit);
}
