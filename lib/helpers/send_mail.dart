import 'dart:convert';

import 'package:http/http.dart' as http;

class SendMail {
  static Future<void> callCloudFunction(
    String email,
    String verificationCode,
  ) async {
    final url = Uri.parse('https://7k3fz34az34wqvj5f6htmzodty0bwaml.lambda-url.eu-north-1.on.aws/');
    final Map<String, dynamic> data = {
      'email': 'anil.icen@metu.edu.tr',
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
// msg = {
//         to: event['email'], // Change to your recipient
//         from: 'e2448488@ceng.metu.edu.tr', // Change to your verified sender
//         subject: 'Verification Code Cengden',
//         text: 'Your verification code is: '+ event['verificationCode'],
//         html:'<strong>Your verification code is:' + event["verificationCode"] + '</strong>',
//     };