import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/User.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:cengden/helpers/request.dart';

class RequestHelper {
  RequestHelper(User user) : user = user;
  User user;

  void addItem() {
    Vehicle vehicle = Vehicle(
      id: '0',
      title: 'Honda Civic 2018',
      type: 'Sedan',
      brand: 'Honda',
      model: 'Civic',
      year: '2018',
      color: 'White',
      engineDisplacement: '1.5L',
      fuelType: 'Petrol',
      transmissionType: 'CVT',
      mileage: '25,000 km',
      price: '\$12,500',
      image:
          'https://cdn1.ntv.com.tr/gorsel/fmeyXtve8UedbPr0eMkOEw.jpg?width=1000&mode=both&scale=both&v=1691735326676',
      description: 'good condition Civic with low mileage',
      createdBy: user,
    );

    Vehicle vehicle2 = Vehicle(
      id: '0',
      title: 'Tesla Model S',
      type: 'Electric Car',
      brand: 'Tesla',
      model: 'Model S',
      year: '2022',
      color: 'Red',
      engineDisplacement: 'N/A',
      fuelType: 'Electric',
      transmissionType: 'Automatic',
      mileage: '10,000 km',
      price: '\$80,000',
      image:
          'https://www.araba.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Ftasit-com%2Fimages%2Ff_webp%2Cq_auto%2Fv1680626856%2Ftesla-model-y-inceleme%2Ftesla-model-y-inceleme.jpg%3F_i%3DAA&w=1920&q=75',
      description: 'Luxurious electric sedan with autopilot feature',
      createdBy: user,
      batteryCapacity: '100 kWh',
      range: '350 km',
    );
    Vehicle vehicle3 = Vehicle(
      id: '1',
      title: 'Airstream Flying Cloud 25FB',
      type: 'Caravan',
      brand: 'Airstream',
      model: 'Flying Cloud 25FB',
      year: '2023',
      color: 'Silver',
      engineDisplacement: '3.0L',
      fuelType: 'Diesel',
      transmissionType: 'Manual',
      mileage: '15,000 miles',
      price: '\$40,000',
      image:
          'https://media.autoexpress.co.uk/image/private/s--wQdYC5rv--/f_auto,t_primary-image-desktop@1/v1652783970/autoexpress/2022/05/Coachman-Lusso-caravan_tsf39e.jpg',
      description: 'Spacious travel trailer for outdoor adventures',
      createdBy: user,
      bedCapacity: 'Sleeps 4',
      waterCapacity: '50 liters',
    );

    Phone phone = Phone(
      id: '0',
      title: "iPhone 13 Pro Max",
      brand: "Apple",
      model: "13 Pro Max",
      year: "2021",
      operatingSystem: "iOS 15",
      processor: "Apple A15 Bionic",
      ram: "6 GB",
      storage: "512 GB",
      cameraSpecs: {"Main": "12MP", "Ultra Wide": "12MP", "Telephoto": "12MP"},
      batteryCapacity: "4352 mAh",
      price: "\$1,099",
      image:
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone15pro-digitalmat-gallery-1-202309_GEO_EMEA?wid=728&hei=666&fmt=png-alpha&.v=1693346851387",
      description: "Super iPhone offering from Apple with improved camera capabilities and long battery life.",
      createdBy: user,
    );

    Computer computer = Computer(
      id: '0',
      title: "Apple MacBook Pro 16-inch",
      type: "Notebook",
      brand: "Apple",
      model: "MacBook Pro",
      year: "2021",
      processor: "Apple M1 Pro",
      ram: "16 GB",
      storage: {"SSD": "512 GB SSD", "HDD": "1 TB HDD"},
      graphicsCard: "Apple M1 Pro",
      operatingSystem: "macOS Monterey",
      price: "\$2,499",
      image:
          "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/page/franchise/xps/fy24-family-launch/laptop-xps-franchise-page-16-9640-sl-800x550-compare.png?fmt=png-alpha&wid=800&hei=550",
      description: "Powerful MacBook Pro with stunning Retina display, perfect for creative professionals.",
      createdBy: user,
    );

    PrivateLesson lesson = PrivateLesson(
      id: '0',
      title: "Programming Fundamentals Course",
      tutorName: "John Smith",
      lessons: ["Data Structures", "Algorithms", "C++"],
      location: "Online",
      duration: "1 hour/session",
      price: "\$60",
      image: "https://blog.pango.education/hubfs/blog_mathslessonplanning-1.jpeg",
      description:
          "Comprehensive course covering programming fundamentals including Data Structures, Algorithms, and C++.",
      createdBy: user,
    );
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle2.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
    Request.addItem(lesson.toJson());
    Request.addItem(vehicle3.toJson());
    Request.addItem(phone.toJson());
    Request.addItem(computer.toJson());
  }

  void getItems() {}
}
