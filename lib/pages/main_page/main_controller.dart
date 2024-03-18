import 'package:cengden/data/ItemRepository.dart';
import 'package:cengden/entities/Computer.dart';
import 'package:cengden/entities/Item.dart';
import 'package:cengden/entities/Phone.dart';
import 'package:cengden/entities/PrivateLesson.dart';
import 'package:cengden/entities/Vehicle.dart';
import 'package:cengden/helpers/request.dart';

class MainController {
  String? title;
  String? firstParam;
  String? secondParam;
  String? thirdParam;
  String? image;

  List<Item> itemList = ItemRepository.itemList;

  void changeParameters(int index) {
    if (itemList.length >= index) {
      if (itemList.elementAt(index).itemType == "Phone") {
        Phone phone = Phone.fromJson(itemList.elementAt(index) as Map<String, dynamic>);
        title = phone.title;
        firstParam = phone.brand;
        secondParam = phone.model;
        thirdParam = phone.operatingSystem;
        image = phone.image;
      }
      if (itemList.elementAt(index).itemType == "Computer") {
        Computer computer = Computer.fromJson(itemList.elementAt(index) as Map<String, dynamic>);
        title = computer.title;
        firstParam = computer.brand;
        secondParam = computer.model;
        thirdParam = computer.operatingSystem;
        image = computer.image;
      }
      if (itemList.elementAt(index).itemType == "Vehicle") {
        Vehicle vehicle = Vehicle.fromJson(itemList.elementAt(index) as Map<String, dynamic>);
        title = vehicle.title;
        firstParam = vehicle.brand;
        secondParam = vehicle.model;
        thirdParam = vehicle.color;
        image = vehicle.image;
      }
      if (itemList.elementAt(index).itemType == "PrivateLesson") {
        PrivateLesson privateLesson = PrivateLesson.fromJson(itemList.elementAt(index) as Map<String, dynamic>);
        title = privateLesson.title;
        firstParam = privateLesson.duration;
        secondParam = privateLesson.location;
        thirdParam = privateLesson.price;
        image = privateLesson.image;
      }
    }
  }
}
