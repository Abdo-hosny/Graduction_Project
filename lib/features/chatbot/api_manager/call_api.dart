import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/response_model.dart';

Future<ChatResponse?> sendMessageToApi(String message) async {
  final url = Uri.parse('https://amira9090-project.hf.space/chat');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"message": message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ChatResponse.fromJson(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }

  return null;
}
