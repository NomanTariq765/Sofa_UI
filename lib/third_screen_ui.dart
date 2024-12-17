import 'package:flutter/material.dart';
import 'package:sofa_ui/second_screen_ui.dart';


class ThirdScreenUi extends StatefulWidget {
  @override
  _ThirdScreenUiState createState() => _ThirdScreenUiState();
}

class _ThirdScreenUiState extends State<ThirdScreenUi> {
  // Quantities for each item
  int minimalistChairQty = 2;
  int elegantWhiteChairQty = 1;
  int vintageChairQty = 1;

  // Prices for each item
  final double minimalistChairPrice = 2000.00;
  final double elegantWhiteChairPrice = 2000.00;
  final double vintageChairPrice = 2500.00;

  final double shippingFee = 30.00;

  double get subtotal {
    return (minimalistChairQty * minimalistChairPrice) +
        (elegantWhiteChairQty * elegantWhiteChairPrice) +
        (vintageChairQty * vintageChairPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreenUi()));
                      },
                      child: Icon(Icons.arrow_back, size: 28, color: Colors.black)),
                  Text("Cart",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  Icon(Icons.shopping_cart, size: 28, color: Colors.black),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCartItem(
                  'Minimalist Chair',
                  minimalistChairPrice,
                  minimalistChairQty,
                      (newQty) => setState(() {
                    minimalistChairQty = newQty;
                  }),
                  'assets/sofa1.png', // Add image path
                ),
                _buildCartItem(
                  'Elegant White Chair',
                  elegantWhiteChairPrice,
                  elegantWhiteChairQty,
                      (newQty) => setState(() {
                    elegantWhiteChairQty = newQty;
                  }),
                  'assets/sofa2.png', // Add image path
                ),
                _buildCartItem(
                  'Vintage Chair',
                  vintageChairPrice,
                  vintageChairQty,
                      (newQty) => setState(() {
                    vintageChairQty = newQty;
                  }),
                  'assets/sofa3.png', // Add image path
                ),
              ],
            ),
          ),
          _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildCartItem(String title, double price, int quantity,
      Function(int) onQuantityChanged, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$${price * quantity}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Fixed-width button for "remove" functionality
                SizedBox(
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      if (quantity > 0) {
                        onQuantityChanged(quantity - 1);
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.red,
                    iconSize: 20,
                  ),
                ),
                // Fixed-width container for quantity text
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Fixed-width button for "add" functionality
                SizedBox(
                  width: 40,
                  child: IconButton(
                    onPressed: () => onQuantityChanged(quantity + 1),
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Selected Items',
                style: TextStyle(fontSize: 16),
              ),
              Text('\$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping Fee',
                style: TextStyle(fontSize: 16),
              ),
              Text('\$${shippingFee.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(height: 32, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${(subtotal + shippingFee).toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: () {
          //     // Handle checkout logic
          //   },
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: const Size(double.infinity, 50),
          //     backgroundColor: Colors.black,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          //   child: const Text(
          //     'Checkout',
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          // ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 10),
                        Text('Payment successfully done!'),
                      ],
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )

        ],
      ),
    );
  }
}

////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter All Widgets Example',
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//
//   void _onNavItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Widgets UI'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               print("Selected: $value");
//             },
//             itemBuilder: (BuildContext context) {
//               return {'Option 1', 'Option 2', 'Option 3'}
//                   .map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Text
//               Text(
//                 'This is a Text Widget',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//
//               // Image
//               Image.network(
//                 'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-2a1118d7e95e513f9ab3bfbbf9161955f0782ea7a0dddcdf722618dcb72d33fb.png',
//                 height: 150,
//               ),
//               SizedBox(height: 10),
//
//               // Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Icon(Icons.home, color: Colors.blue, size: 40),
//                   Icon(Icons.favorite, color: Colors.red, size: 40),
//                   Icon(Icons.star, color: Colors.amber, size: 40),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               // Container
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'This is a Container',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Elevated Button'),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text('Text Button'),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.play_arrow),
//                     color: Colors.green,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               // Input Fields
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Enter Text',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               // Checkbox and Switch
//               Row(
//                 children: [
//                   Checkbox(
//                     value: true,
//                     onChanged: (bool? value) {},
//                   ),
//                   Text('Checkbox'),
//                   Spacer(),
//                   Switch(
//                     value: true,
//                     onChanged: (bool value) {},
//                   ),
//                   Text('Switch'),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               // Slider
//               Text('Slider'),
//               Slider(
//                 value: 50,
//                 min: 0,
//                 max: 100,
//                 onChanged: (double value) {},
//               ),
//               SizedBox(height: 10),
//
//               // Stack
//               Stack(
//                 children: [
//                   Container(
//                     height: 150,
//                     width: double.infinity,
//                     color: Colors.orange,
//                   ),
//                   Positioned(
//                     top: 50,
//                     left: 50,
//                     child: Container(
//                       height: 50,
//                       width: 50,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               // ListView
//               Text('Scrollable ListView:'),
//               Container(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Container(width: 100, color: Colors.red),
//                     SizedBox(width: 10),
//                     Container(width: 100, color: Colors.green),
//                     SizedBox(width: 10),
//                     Container(width: 100, color: Colors.blue),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               // GridView
//               Text('GridView (shrinkWrapped):'),
//               GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   Container(color: Colors.pink),
//                   Container(color: Colors.cyan),
//                   Container(color: Colors.indigo),
//                   Container(color: Colors.yellow),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onNavItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
