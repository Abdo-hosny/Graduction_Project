import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/womens_tops_screen.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  String selectedCategory = 'Women'; // Default screen
  bool isSearching = false; // Track search state
  TextEditingController searchController = TextEditingController();

  void _onSearchTap(BuildContext context) {
    setState(() {
      isSearching = true;
    });
  }

  void _onBackTap(BuildContext context) {
    if (isSearching) {
      setState(() {
        isSearching = false; // Close search mode
        searchController.clear(); // Clear the search text
      });
    } else if (Navigator.canPop(context)) {
      Navigator.pop(context); // Back to previous screen
    } else {
      print("No screen to pop.");
    }
  }

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => _onBackTap(context),
        ),
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.black),
              )
            : const Text('Categories', style: TextStyle(color: Colors.black)),
        actions: [
          if (!isSearching)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () => _onSearchTap(context),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryTab(
                  title: 'Women',
                  isActive: selectedCategory == 'Women',
                  onTap: () => _selectCategory('Women'),
                ),
                CategoryTab(
                  title: 'Men',
                  isActive: selectedCategory == 'Men',
                  onTap: () => _selectCategory('Men'),
                ),
                CategoryTab(
                  title: 'Kids',
                  isActive: selectedCategory == 'Kids',
                  onTap: () => _selectCategory('Kids'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Sale banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'SUMMER SALES\nUp to 50% off',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category content changes based on selected tab
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _getCategoryItems(selectedCategory),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getCategoryItems(String category) {
    return [
      CategoryItem(
        title: 'New in $category',
        image:
            'https://assets.vogue.com/photos/64c2bbe1d9567128b71301f8/master/w_2560%2Cc_limit/NAP_HSCampaign_FinalRetouch_CrisFragkou_7.jpg',
        category: category,
        onTap: (category == 'Women')
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WomenProducts()),
                )
            : null,
      ),
      CategoryItem(
        title: '$category Clothes',
        image:
            'https://www.statusanxiety.com/cdn/shop/files/status-anxiety-apparel-pants-frontier-bone-10-lifestyle-img.jpg?v=1742784157&width=1200',
        category: category,
        onTap: (category == 'Women')
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WomenProducts()),
                )
            : null,
      ),
      CategoryItem(
        title: '$category Shoes',
        image: 'https://i.imgur.com/rwK7AvH.png',
        category: category,
      ),
      CategoryItem(
        title: '$category Accessories',
        image: 'https://i.imgur.com/KeayNOm.png',
        category: category,
      ),
    ];
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryTab({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String category;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                  title: title,
                  category: category,
                ),
              ),
            );
          },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title, style: const TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String title;
  final String category;

  const CategoryDetailScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          'Details for $title in $category',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
