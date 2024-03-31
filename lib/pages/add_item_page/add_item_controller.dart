import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/domain/repositories/item_repository.dart';
import 'package:cengden/navigator.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddItemController extends Controller {
  AddItemController(
    ItemRepository itemRepository,
    User user,
  )   : _itemRepository = itemRepository,
        user = user;

  final ItemRepository _itemRepository;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  String selectedType = "Phone";
  User user;
  @override
  late Phone phone;
  late Computer computer;
  late Vehicle vehicle;
  late PrivateLesson privateLesson;

  void onInitState() {
    phone = Phone(
      id: '',
      title: '',
      brand: '',
      model: '',
      year: '',
      operatingSystem: '',
      processor: '',
      ram: '',
      storage: '',
      cameraSpecs: {},
      batteryCapacity: '',
      price: '',
      image: '',
      description: '',
      createdBy: user,
    );
    computer = Computer(
      id: '',
      title: '',
      type: '',
      brand: '',
      model: '',
      year: '',
      processor: '',
      ram: '',
      storage: {},
      graphicsCard: '',
      operatingSystem: '',
      price: '',
      image: '',
      description: '',
      createdBy: user,
    );

    vehicle = Vehicle(
      id: '',
      title: '',
      type: '',
      brand: '',
      model: '',
      year: '',
      color: '',
      engineDisplacement: '',
      fuelType: '',
      transmissionType: '',
      mileage: '',
      price: '',
      image: '',
      description: '',
      createdBy: user,
    );

    privateLesson = PrivateLesson(
      id: '',
      title: '',
      tutorName: '',
      lessons: [],
      location: '',
      duration: '',
      price: '',
      image: '',
      description: '',
      createdBy: user,
    );
  }

  void setTypeAsPhone() {
    selectedType = "Phone";
    refreshUI();
  }

  void setTypeAsComputer() {
    selectedType = "Computer";
    refreshUI();
  }

  void setTypeAsVehicle() {
    selectedType = "Vehicle";
    refreshUI();
  }

  void setTypeAsPrivateLesson() {
    selectedType = "PrivateLesson";
    refreshUI();
  }

  Future<void> addPhone(context) async {
    await _itemRepository.addItem(phone.toJson());
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> addComputer(context) async {
    await _itemRepository.addItem(computer.toJson());
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> addVehicle(context) async {
    await _itemRepository.addItem(vehicle.toJson());
    CengdenNavigator.navigateToMainView(context, user);
  }

  Future<void> addPrivateLesson(context) async {
    await _itemRepository.addItem(privateLesson.toJson());
    CengdenNavigator.navigateToMainView(context, user);
  }
}
