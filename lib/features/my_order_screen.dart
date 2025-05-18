// import 'package:flutter/material.dart';
// import 'package:flutter_application_14/auth/pages/order_details.dart';

// class MyOrdersScreen extends StatefulWidget {
//   @override
//   _MyOrdersScreenState createState() => _MyOrdersScreenState();
// }

// class _MyOrdersScreenState extends State<MyOrdersScreen> {
//   int selectedIndex = 0;

//   final List<String> tabs = ['Delivered', 'Processing', 'Cancelled'];

//   Widget getTabContent() {
//     switch (selectedIndex) {
//       case 0:
//         return OrderList(status: 'Delivered', color: Colors.green);
//       case 1:
//         return EmptyState(message: 'No orders in Processing');
//       case 2:
//         return EmptyState(message: 'No orders in Cancelled');
//       default:
//         return Container();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData(color: Colors.black),
//         //  titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
//         actions: const [
//           Icon(Icons.search),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'My Orders',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children:
//                 List.generate(tabs.length, (index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == index
//                               ? Colors.black
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Text(
//                           tabs[index],
//                           style: TextStyle(
//                             color: selectedIndex == index
//                                 ? Colors.white
//                                 : Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           // Tab Content
//           Expanded(child: getTabContent()),
//         ],
//       ),
//     );
//   }
// }

// class OrderList extends StatelessWidget {
//   final String status;
//   final Color color;

//   const OrderList({Key? key, required this.status, required this.color})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.all(12),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 3,
//           margin: EdgeInsets.symmetric(vertical: 12),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Order №1947034',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Text(
//                       '05-12-2024',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 // Order details
//                 Text('Tracking number: IW3475453455',
//                     style: TextStyle(color: Colors.grey)),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text('Quantity: ',
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold)),
//                         Text('3',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('Total Amount: ',
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold)),
//                         Text(
//                           '112\$',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => OrderDetails()));
//                       },
//                       child: Text(
//                         'Details',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     ),
//                     // Status
//                     Text(
//                       status,
//                       style:
//                           TextStyle(color: color, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class EmptyState extends StatelessWidget {
//   final String message;

//   const EmptyState({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         message,
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'order_details.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int selectedIndex = 0;

  final List<String> tabs = ['Delivered', 'Processing', 'Cancelled'];

  void navigateToTab(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProcessingOrdersScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CancelledOrdersScreen()),
      );
    }
  }

  Widget getTabContent() {
    if (selectedIndex == 0) {
      return const OrderList(status: 'Delivered', color: Colors.green);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Orders',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(tabs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => navigateToTab(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(child: getTabContent()),
        ],
      ),
    );
  }
}

class ProcessingOrdersScreen extends StatelessWidget {
  const ProcessingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Processing Orders')),
      body: const Center(
        child: Text(
          'No orders in Processing',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CancelledOrdersScreen extends StatelessWidget {
  const CancelledOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cancelled Orders')),
      body: const Center(
        child: Text(
          'No orders in Cancelled',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final String status;
  final Color color;

  const OrderList({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order №1947034',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '05-12-2024',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Tracking number: IW3475453455',
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Quantity: ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        Text('3',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Total Amount: ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        Text(
                          '112\$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetails()));
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        'Details',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Text(
                      status,
                      style:
                          TextStyle(color: color, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
