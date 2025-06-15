import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../features/auth/logic/SignUpResponse.dart';
import '../../features/auth/logic/email.dart';
import '../const/api_constants.dart';
import '../model/AllProducts.dart';



class ApiManager {

  static Future<ProductResponse> searchPlace() async {
    Uri url = Uri.https(
      ApiConstants.baseUrlAllProducts,
      ApiConstants.endPointAllProducts,
    );

    try {
      final response = await http.get(
        url,
      );

      print("Response: ${response.body}");

      final jsonData = jsonDecode(response.body);
      return ProductResponse.fromJson(jsonData);

    } catch (e) {
      throw Exception("حدث خطأ أثناء الاتصال بالسيرفر: $e");
    }
  }



}

// Future<SignUpResponse> signInUser(SignInModelRequest signInUser) async {
//   try {
//     final response = await http.post(
//       Uri.parse('https://monsef74.pythonanywhere.com/api/userinfo/'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(signInUser.toJson()),
//     );
//     return SignUpResponse.fromJson(jsonDecode(response.body));
//   } on Exception catch (e) {
//     throw Exception(e.toString());
//   }
// }


Future<SignUpResponse> signUpUser(RequestSignUpModel user) async {
  final url = Uri.parse('http://monsef74.pythonanywhere.com/api/register/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(user.toJson()),
  );

  print('Status code: ${response.statusCode}');
  print('Response body: ${response.body}');

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return SignUpResponse.fromJson(responseData);

}


Future<SignUpResponse> signInUser(SignInModelRequest signInUser) async {
  try {
    final response = await http.get(
      Uri.parse('https://monsef74.pythonanywhere.com/api/userinfo/'),
      headers: {'Content-Type': 'application/json'},
    );
    return SignUpResponse.fromJson(jsonDecode(response.body));
  } on Exception catch (e) {
    throw Exception(e.toString());
  }
}


/*

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // ✨ مهم جدًا

class ModelScreen extends StatefulWidget {
  static String touteNAme = "AI";

  @override
  _ModelScreenState createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  File? avatarImage;
  File? clothingImage;
  String? resultImageUrl;
  bool isLoading = false;

  Future<void> pickImage(ImageSource source, bool isAvatar) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isAvatar) {
          avatarImage = File(pickedFile.path);
        } else {
          clothingImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> uploadImages() async {
    if (avatarImage == null || clothingImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('اختر الصورتين أولًا')),
      );
      return;
    }

    setState(() => isLoading = true);

    final url = Uri.parse("http://monsef74.pythonanywhere.com/api/tryon/");
    final request = http.MultipartRequest('POST', url);

    try {
      request.files.add(await http.MultipartFile.fromPath(
        'avatar_image',
        avatarImage!.path,
        contentType: MediaType('image', 'jpeg'), // 🎯 هنا الفرق
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'clothing_image',
        clothingImage!.path,
        contentType: MediaType('image', 'jpeg'), // 🎯 هنا برضه
      ));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('🔁 Status Code: ${response.statusCode}');
      print('📩 Response Body: $responseBody');

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);
        setState(() {
          resultImageUrl = data['result_image_url'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ فشل في رفع الصور - كود ${response.statusCode}')),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      print("❗ Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❗ حدث خطأ أثناء الرفع: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Try On')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () => pickImage(ImageSource.gallery, true),
                icon: Icon(Icons.person),
                label: Text("اختر صورة الشخص"),
              ),
              if (avatarImage != null)
                Image.file(avatarImage!, height: 150),

              SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () => pickImage(ImageSource.gallery, false),
                icon: Icon(Icons.checkroom),
                label: Text("اختر صورة الملابس"),
              ),
              if (clothingImage != null)
                Image.file(clothingImage!, height: 150),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading ? null : uploadImages,
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text('Try On'),
              ),

              if (resultImageUrl != null) ...[
                SizedBox(height: 20),
                Text("النتيجة:"),
                Image.network(resultImageUrl!),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

 */