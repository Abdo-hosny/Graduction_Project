import 'package:flutter/material.dart';
import '../../../APi/const/api_constants.dart';

class ListItemSales extends StatelessWidget {
  final void Function()? onPressed;
  final String imageUrl;
  final bool? showButton;
  final String? type;
  final String name;
  final String price;
  final double fontSizePrice;
  final double fontSizeText;
  final double  height;
  const ListItemSales({

    super.key,
    this.onPressed,
    required this.imageUrl,
     this.type,
    this.fontSizeText =15,
    this.fontSizePrice =13,
    this.height =280,
    required this.name,
    required this.price,
    this.showButton=false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.0),
        child: DecoratedBox(
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  ApiConstants.getFullImageUrl(imageUrl),
                  height: 180,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ),
              // Stack(
              //   children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(12.0),
              //       child: Image.network(
              //           ApiConstants.getFullImageUrl(imageUrl),
              //         height: 150,
              //         width: 120,
              //         fit: BoxFit.cover,
              //         errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              //       ),
              //     ),
              //     Positioned(
              //       top: 8,
              //       left: 8,
              //       child: Container(
              //         width: 45,
              //         height: 35,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(16.0),
              //           color: Colors.red,
              //         ),
              //         child: const Center(
              //           child: Text(
              //             '5%', // خصم ثابت أو ممكن تيجي من API لاحقًا
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 5),
              Text(
                type ??'',
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize:  fontSizeText,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                '$price EGP',
                style: TextStyle(
                    fontSize: fontSizePrice,
                    color: Colors.black),
              ),
             if(showButton==true)
               ElevatedButton(
                   onPressed: onPressed, child: const Text(
                   "Try on",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
