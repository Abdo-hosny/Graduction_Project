import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const RowTextWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Spacer(),
        TextButton(
          onPressed: () {
            onTap();
          },
          child: Text("change", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
