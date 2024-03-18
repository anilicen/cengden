import 'package:cengden/data/ItemRepository.dart';
import 'package:cengden/entities/Computer.dart';
import 'package:cengden/entities/Phone.dart';
import 'package:cengden/entities/PrivateLesson.dart';
import 'package:cengden/entities/Vehicle.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import the dart:convert library

class Request {
  static String link =
      "https://eu-central-1.aws.services.cloud.mongodb.com/api/client/v2.0/app/data-jtnzf/auth/providers/anon-user/login";
  static String? accessToken;
  static String? refreshToken;
  static String? userId;
  static const String endpoint = "https://eu-central-1.aws.data.mongodb-api.com/app/data-jtnzf/endpoint/data/v1";

  static void addItem(Map<String, dynamic> json) async {
    var url = "$endpoint/action/insertOne";

    var response = await Dio().post(
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

  static Future<void> sendPostRequest() async {
    var url = Uri.parse(link);
    var response = await http.post(
      url,
    );
    print('POST request URL: $url'); // Print the URL here
    if (response.statusCode == 201) {
      print('POST request successful');
      print('Response body: ${response.body}');
    } else {
      print('POST request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    // Assuming your response body is stored in a variable called responseBody
    // Parse the JSON response body
    Map<String, dynamic> parsedResponse = json.decode(response.body);

    // Access specific fields in the parsed response
    accessToken = parsedResponse['access_token'];
    refreshToken = parsedResponse['refresh_token'];
    userId = parsedResponse['user_id'];

    // Print the parsed fields
    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');
    print('User ID: $userId');
  }

  static void getItems(List list) async {
    final params = {'skip': 0, 'limit': 10};

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
    print("RESPONSE");
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      switch (docs.elementAt(index)['itemType']) {
        case "Phone":
          list.add(Phone.fromJson(docs.elementAt(index)));
          break;
        case "Computer":
          list.add(Computer.fromJson(docs.elementAt(index)));
          break;
        case "PrivateLesson":
          list.add(PrivateLesson.fromJson(docs.elementAt(index)));
          break;
        case "Vehicle":
          list.add(Vehicle.fromJson(docs.elementAt(index)));
          break;
      }
    }
  }
}
