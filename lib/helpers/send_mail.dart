import 'dart:convert';

import 'package:http/http.dart' as http;

class SendMail {
  static Future<void> callCloudFunction(
    String email,
    String verificationCode,
  ) async {
    final url = Uri.parse('https://7k3fz34az34wqvj5f6htmzodty0bwaml.lambda-url.eu-north-1.on.aws/');
    final Map<String, dynamic> data = {
      'email': email,
      'verificationCode': verificationCode,
    };
    // print('email here: ' + data['email']);
    try {
      final response = await http.post(
        url,
        body: jsonEncode(data), // Convert data to JSON string
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Error calling Cloud Function: $e');
    }
  }
}
