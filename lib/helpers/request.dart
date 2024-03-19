import 'package:cengden/domain/entities/Computer.dart';
import 'package:cengden/domain/entities/Phone.dart';
import 'package:cengden/domain/entities/PrivateLesson.dart';
import 'package:cengden/domain/entities/Vehicle.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request {
  static String link =
      "https://eu-central-1.aws.services.cloud.mongodb.com/api/client/v2.0/app/data-jtnzf/auth/providers/anon-user/login";
  static String? accessToken;
  static String? refreshToken;
  static String? userId;
  static const String endpoint = "https://eu-central-1.aws.data.mongodb-api.com/app/data-jtnzf/endpoint/data/v1";

  static void addItem(Map<String, dynamic> json) async {
    var url = "$endpoint/action/insertOne";

    await Dio().post(
      url,
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "document": json,
        },
      ),
    );
  }

  static Future<void> sendPostRequest(List<bool> token) async {
    var url = Uri.parse(link);
    var response = await http.post(
      url,
    );
    Map<String, dynamic> parsedResponse = json.decode(response.body);

    accessToken = parsedResponse['access_token'];
    token[0] = true;
    refreshToken = parsedResponse['refresh_token'];
    userId = parsedResponse['user_id'];
  }

  static Future<void> getPhoneItems(List<Phone> phoneList, int skip, int limit) async {
    final params = {'skip': skip, 'limit': limit};

    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "filter": {'itemType': 'Phone'},
          ...params,
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      phoneList.add(Phone.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> getVehicleItems(List<Vehicle> vehicleList, int skip, int limit) async {
    final params = {'skip': skip, 'limit': limit};

    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "filter": {'itemType': 'Vehicle'},
          ...params,
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      vehicleList.add(Vehicle.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> getComputerItems(List<Computer> computerItems, int skip, int limit) async {
    final params = {'skip': skip, 'limit': limit};

    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "filter": {'itemType': 'Computer'},
          ...params,
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      computerItems.add(Computer.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> getPrivateLessonItems(List<PrivateLesson> privateLessonList, int skip, int limit) async {
    final params = {'skip': skip, 'limit': limit};

    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "filter": {'itemType': 'PrivateLesson'},
          ...params,
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      privateLessonList.add(PrivateLesson.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> getItems(List itemList, List<Phone> phoneList, List<Vehicle> vehicleList,
      List<Computer> computerList, List<PrivateLesson> privateLessonList, int skip) async {
    final params = {'skip': skip, 'limit': 10};

    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "trial",
          "collection": "items",
          "filter": {},
          ...params,
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      switch (docs.elementAt(index)['itemType']) {
        case "Phone":
          itemList.add(Phone.fromJson(docs.elementAt(index)));
          phoneList.add(Phone.fromJson(docs.elementAt(index)));
          break;
        case "Computer":
          itemList.add(Computer.fromJson(docs.elementAt(index)));
          computerList.add(Computer.fromJson(docs.elementAt(index)));
          break;
        case "PrivateLesson":
          itemList.add(PrivateLesson.fromJson(docs.elementAt(index)));
          privateLessonList.add(PrivateLesson.fromJson(docs.elementAt(index)));
          break;
        case "Vehicle":
          itemList.add(Vehicle.fromJson(docs.elementAt(index)));
          vehicleList.add(Vehicle.fromJson(docs.elementAt(index)));
          break;
      }
    }
  }
}
