import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/repositories/item_repository.dart';
import 'package:cengden/helpers/request_helper.dart';
import 'package:cengden/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class MainController extends Controller {
  MainController(
    ItemRepository itemRepository,
    User user,
  )   : _itemRepository = itemRepository,
        user = user;

  final ItemRepository _itemRepository;
  List<Item>? itemList;
  int pageNumber = 0;
  String pageType = "Items";
  User user;
  // List<Item> itemList = ItemRepository.itemList;
  @override
  Future<void> onInitState() async {
    await _itemRepository.getItems(0);
    itemList = _itemRepository.getItemList();
    refreshUI();
    super.onInitState();
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  Future<void> goToNextPage() async {
    pageNumber++;
    if (itemList!.length <= (pageNumber) * 10) {
      if (pageType == "Items") {
        await _itemRepository.getItems(pageNumber * 10);
        itemList = _itemRepository.getItemList();
      } else if (pageType == "Phones") {
        int skip = itemList!.length;
        int limit = (pageNumber + 1) * 10 - skip;
        await _itemRepository.getPhoneItems(skip, limit);
        itemList = _itemRepository.getPhoneList();
      } else if (pageType == "Vehicles") {
        int skip = itemList!.length;
        int limit = (pageNumber + 1) * 10 - skip;
        await _itemRepository.getVehicleItems(skip, limit);
        itemList = _itemRepository.getVehicleList();
      } else if (pageType == "Computers") {
        int skip = itemList!.length;
        int limit = (pageNumber + 1) * 10 - skip;
        await _itemRepository.getComputerItems(skip, limit);
        itemList = _itemRepository.getComputerList();
      } else if (pageType == "PrivateLessons") {
        int skip = itemList!.length;
        int limit = (pageNumber + 1) * 10 - skip;
        await _itemRepository.getPrivateLessonItems(skip, limit);
        itemList = _itemRepository.getPrivateLessonList();
      }
    }
    refreshUI();
  }

  Future<void> goToPrevPage() async {
    pageNumber--;
    refreshUI();
  }

  Future<void> showAllItems() async {
    pageNumber = 0;
    itemList = _itemRepository.getItemList();
    pageType = "Items";
    refreshUI();
  }

  Future<void> showPhones() async {
    pageNumber = 0;
    itemList = _itemRepository.getPhoneList();
    if (itemList!.length < 10) {
      await _itemRepository.getPhoneItems(itemList!.length, 10 - itemList!.length);
      itemList = _itemRepository.getPhoneList();
    }
    pageType = "Phones";
    refreshUI();
  }

  Future<void> showVehicles() async {
    pageNumber = 0;
    itemList = _itemRepository.getVehicleList();
    if (itemList!.length < 10) {
      await _itemRepository.getVehicleItems(itemList!.length, 10 - itemList!.length);
      itemList = _itemRepository.getVehicleList();
    }
    pageType = "Vehicles";
    refreshUI();
  }

  Future<void> showComputers() async {
    pageNumber = 0;
    itemList = _itemRepository.getComputerList();
    if (itemList!.length < 10) {
      await _itemRepository.getComputerItems(itemList!.length, 10 - itemList!.length);
      itemList = _itemRepository.getComputerList();
    }
    pageType = "Computers";
    refreshUI();
  }

  Future<void> showPrivateLessons() async {
    pageNumber = 0;
    itemList = _itemRepository.getPrivateLessonList();
    if (itemList!.length < 10) {
      await _itemRepository.getPrivateLessonItems(itemList!.length, 10 - itemList!.length);
      itemList = _itemRepository.getPrivateLessonList();
    }
    pageType = "PrivateLessons";
    refreshUI();
  }

  void navigateToRegistrationView(BuildContext context) {
    CengdenNavigator.navigateToRegistrationView(context);
  }

  void navigateToLoginView(BuildContext context) {
    CengdenNavigator.navigateToLoginView(context);
  }

  void navigateToItemDetailsView(BuildContext context, item) {
    CengdenNavigator.navigateToItemDetailsView(context, item, user);
  }

  void navigateToAddItemView(BuildContext context) {
    CengdenNavigator.navigateToAddItemView(context, user);
  }

  void navigateToProfileView(BuildContext context) {
    CengdenNavigator.navigateToProfileView(context, user);
  }
}
