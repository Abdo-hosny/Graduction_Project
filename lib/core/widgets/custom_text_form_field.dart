import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
typedef Validator = String? Function(String?);

class TextFormFieldWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  bool obscureText;
  final bool isPassword;
  final TextEditingController controller;
  final Validator myValidator;
  final bool? enabled;
  bool isPhone;
  final double horizontalPadding;
  final double verticalPadding;
  final TextStyle? textStyle;
  final Widget? prefixIcon; // ✅ أضفنا هذا

  TextFormFieldWidget({
    required this.title,
    required this.controller,
    required this.myValidator,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 7.0,
    this.textStyle,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPhone = false,
    this.isPassword = false,
    super.key,
    this.enabled,
    this.prefixIcon, // ✅ أضفنا هذا
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 2),
          child: Text(
            widget.title,
            style: widget.textStyle ??
                const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // medium
                  color: Colors.black,
                ),
          ),
        ),
        TextFormField(
          enabled: widget.enabled ?? true,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: widget.enabled == false ? Colors.grey : Colors.black,
          ),
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                widget.obscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            )
                : null,
            prefixIcon:
               widget.prefixIcon,
            prefixIconColor: Colors.grey,
            contentPadding:  const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            enabledBorder: outlineInputBorder(color: Colors.grey, width: 1),
            disabledBorder: outlineInputBorder(color: Colors.grey, width: 1),
            focusedBorder: outlineInputBorder(color: Colors.blue, width: 2),
            errorBorder: outlineInputBorder(color: Colors.red, width: 1),
            focusedErrorBorder:
            outlineInputBorder(color: Colors.red, width: 1),
          ),
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.myValidator,
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder({
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

