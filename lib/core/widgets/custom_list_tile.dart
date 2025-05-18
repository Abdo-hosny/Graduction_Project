import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String title;
  String subTitle;
  VoidCallback onTap;
  CustomListTile({required this.title, required this.subTitle,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black26,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: onTap,
    );
  }
}
