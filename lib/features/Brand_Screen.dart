// 




import 'package:flutter/material.dart';

class Brand {
  String name;
  bool isSelected;

  Brand(this.name, this.isSelected);
}

class BrandFilterScreen extends StatefulWidget {
  @override
  _BrandFilterScreenState createState() => _BrandFilterScreenState();
}

class _BrandFilterScreenState extends State<BrandFilterScreen> {
  List<Brand> brands = [
    Brand("adidas", false),
    Brand("Zara", false),
    Brand("H&M", false),
    Brand("Blend", false),
    Brand("Boutique Moschino", false),
    Brand("Champion", false),
    Brand("Diesel", false),
    Brand("Jack & Jones", false),
    Brand("Naf Naf", false),
    Brand("Red Valentino", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Brand"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      brands[index].name,
                      style: TextStyle(
                        color: brands[index].isSelected
                            ? Colors.red
                            : Colors.black,
                        fontWeight: brands[index].isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    value: brands[index].isSelected,
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        brands[index].isSelected = value!;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                       
                      },
                      child: Text("Discard", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Apply logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Apply", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        );
  }
}
