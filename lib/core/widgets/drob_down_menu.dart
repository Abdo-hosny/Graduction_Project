import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['XS', 'S', 'M', 'L', 'XL', 'XXL'];
const List<String> list2 = <String>[
  'Black',
  'Blue',
  'Amber',
  'Grey',
];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DropdownButtonExample();
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: null,
            icon: const Icon(Icons.arrow_drop_down_sharp),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            hint: const Text("Size"),
            decoration:  InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            //underline: Container(height: 2, color: Colors.deepPurpleAccent),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
        const SizedBox(width: 140,),
        Expanded(

          child: DropdownButtonFormField<String>(
            value: null,
            icon: const Icon(Icons.arrow_drop_down_sharp),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            hint: const Text("Color"),
            decoration:  InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            //underline: Container(height: 2, color: Colors.deepPurpleAccent),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list2.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
