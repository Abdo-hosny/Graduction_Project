

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

