import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Item.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/domain/repositories/item_repository.dart';
import 'package:cengden/domain/repositories/user_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ItemDetailsController extends Controller {
  ItemDetailsController(
    ItemRepository itemRepository,
    UserRepository userRepository,
    Item item,
    User user,
  )   : _itemRepository = itemRepository,
        _userRepository = userRepository,
        item = item,
        user = user;

  final ItemRepository _itemRepository;
  final UserRepository _userRepository;
  Item item;
  User user;
  String? email;
  bool isOwner = false;
  String id = '';

  @override
  onInitState() {
    if (item.itemType == "Phone") {
      Phone phone = item as Phone;
      email = phone.createdBy.email;
      id = phone.id;
    } else if (item.itemType == "Computer") {
      Computer computer = item as Computer;
      email = computer.createdBy.email;
      id = computer.id;
    } else if (item.itemType == "Vehicle") {
      Vehicle vehicle = item as Vehicle;
      email = vehicle.createdBy.email;
      id = vehicle.id;
    } else if (item.itemType == "PrivateLesson") {
      PrivateLesson privateLesson = item as PrivateLesson;
      email = privateLesson.createdBy.email;
      id = privateLesson.id;
    }

    if (email == user.email) isOwner = true;
  }

  void initListeners() {
    // TODO: implement initListeners
  }

  void updateItem(context) {
    CengdenNavigator.navigateToUpdateItemView(context, user, item);
  }

  void addToFavorites() {
    user.favoriteItemList.add(id);
    _userRepository.updateFavoriteList(user);
    refreshUI();
  }

  void deleteItem(context) {
    _itemRepository.deleteItem(id);
    CengdenNavigator.navigateToMainView(context, user);
  }
}
