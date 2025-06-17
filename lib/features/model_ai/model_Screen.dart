import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../APi/manger/api_anager.dart';
import '../../APi/model/AllProducts.dart';
import '../../APi/model/ProductModel.dart';
import '../home_screen/widget/list_item_sale.dart';

class ModelScreen extends StatefulWidget {
  @override
  _ModelScreenState createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  File? avatarImage;
  File? clothingImage;
  String? resultImageUrl;
  bool isLoading = false;

  Future<void> pickImage(bool isAvatar) async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 100,
    );
    if (picked != null) {
      setState(() {
        if (isAvatar) {
          avatarImage = File(picked.path);
        } else {
          clothingImage = File(picked.path);
        }
      });
    }
  }

  Future<String?> tryOnImages({
    required File avatarImage,
    required File clothingImage,
  }) async {
    final url = Uri.parse('http://monsef74.pythonanywhere.com/api/tryon/');
    final request = http.MultipartRequest('POST', url);

    request.files.add(await http.MultipartFile.fromPath(
      'avatar_image',
      avatarImage.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    request.files.add(await http.MultipartFile.fromPath(
      'clothing_image',
      clothingImage.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    request.headers.addAll({'Accept': 'application/json'});

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);
        return data['result_image_url'];
      } else {
        print('Server Error: ${response.statusCode}');
        print('Response Body: $responseBody');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }

  Future<void> uploadImages() async {
    if (avatarImage == null || clothingImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both images')),
      );
      return;
    }

    setState(() {
      isLoading = true;
      resultImageUrl = null;
    });

    final result = await tryOnImages(
      avatarImage: avatarImage!,
      clothingImage: clothingImage!,
    );

    setState(() {
      isLoading = false;
      if (result != null) {
        resultImageUrl = result;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to get result image')),
        );
      }
    });
  }

  Future<void> downloadAndSetClothingImage(String imageUrl) async {
    try {
      if (!imageUrl.startsWith('http')) {
        imageUrl = 'http://monsef74.pythonanywhere.com' + imageUrl;
      }

      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        final file = File(filePath);
        await file.writeAsBytes(bytes);

        setState(() {
          clothingImage = file;
        });
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  Widget buildImageCard({
    required String label,
    required File? image,
    required VoidCallback onPick,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(
                  fontSize: 18,
                    fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.image,color: Colors.blue,),
                  onPressed: onPick,
                )
              ],
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image != null
                    ? Image.file(image, fit: BoxFit.cover)
                    : const Center(
                  child: Text(
                    'No image selected',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUploadButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: isLoading ? null : uploadImages,
      icon: isLoading
          ? const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
      )
          : const Icon(Icons.auto_awesome,color: Colors.white,size: 25,),
      label: const Text("Try On", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
    );
  }

  Widget buildResultCard(String resultImageUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(top: 24),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Result", style: TextStyle(
              fontSize: 18,
                color: Colors.blue,fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(resultImageUrl),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text('Try On AI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<ProductResponse>(
                future: ApiManager.searchPlace(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Skeletonizer(
                      child: SizedBox(
                        height: 280,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (_, __) => SizedBox(width: 10),
                          itemBuilder: (_, __) => Container(width: 180, color: Colors.grey),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final products = snapshot.data?.products ?? [];
                  if (products.isEmpty) {
                    return Center(child: Text('No data available'));
                  }

                  return SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return ListItemSales(
                          showButton: true,
                          onPressed: () {
                            if (item.image != null && item.image!.isNotEmpty) {
                              String imageUrl = item.image!;
                              if (!imageUrl.startsWith('http')) {
                                imageUrl = 'http://monsef74.pythonanywhere.com' + imageUrl;
                              }
                              downloadAndSetClothingImage(imageUrl);
                            }
                          },
                          imageUrl: item.image ?? '',
                          name: item.name ?? '',
                          price: item.price ?? '',
                        );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 8,),


              buildImageCard(
                label: 'Avatar Image',
                image: avatarImage,
                icon: Icons.person,
                onPick: () => pickImage(true),
              ),
              buildImageCard(
                label: 'Clothing Image',
                image: clothingImage,
                icon: Icons.checkroom,
                onPick: () => pickImage(false),
              ),
              SizedBox(height: 16),
              buildUploadButton(),
              if (resultImageUrl != null) buildResultCard(resultImageUrl!),
            ],
          ),
        ),
      ),
    );
  }
}
