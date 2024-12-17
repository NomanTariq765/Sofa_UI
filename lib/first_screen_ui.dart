import 'package:flutter/material.dart';
import 'package:sofa_ui/second_screen_ui.dart';

class FirstScreenUi extends StatefulWidget {
  const FirstScreenUi({super.key});

  @override
  State<FirstScreenUi> createState() => _FirstScreenUiState();
}

class _FirstScreenUiState extends State<FirstScreenUi> {
  List<bool> favoriteStates = [false, false, false];
  final TextEditingController _searchController = TextEditingController();
  List<String> items = [
    'English Roll Arm sofa',
    'Divan',
    'Camelback Sofa',
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row with Menu and Profile Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,  // Allow the bottom sheet to scroll
                          builder: (context) => Container(
                            color: Colors.black,
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Avoid overflowing by adjusting the column size
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 20),
                                  color: Colors.blue,
                                  child: Column(
                                    children: const [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage('assets/Noman1.png'), // Replace with your image path
                                      ),
                                      SizedBox(height: 10),
                                      Text('Noman Tariq', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      Text('nomantariq765@gmail.com', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.home, color: Colors.white),
                                  title: const Text('Home', style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.favorite, color: Colors.white),
                                  title: const Text('Favorite', style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.update, color: Colors.white),
                                  title: const Text('Update', style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.language, color: Colors.white),
                                  title: const Text('Language', style: TextStyle(color: Colors.white)),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.settings, color: Colors.white),
                                  title: const Text('Settings', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/more.png', // Replace with your menu image path
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              backgroundColor: Color(0xFFF5F6F8),
                              appBar: AppBar(
                                backgroundColor: Color(0xFFF5F6F8),
                                centerTitle: true,
                                title: const Text("Profile"),
                              ),
                              body: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundImage: AssetImage('assets/Noman1.png'),
                                    ),
                                    const SizedBox(height: 20),
                                    ListTile(
                                      leading: const Icon(Icons.person),
                                      title: const Text("Name"),
                                      subtitle: const Text("Noman Tariq"),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.phone),
                                      title: const Text("Phone"),
                                      subtitle: const Text("+92 313 5847025"),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.email),
                                      title: const Text("Email"),
                                      subtitle: const Text("nomantariq765@gmail.com"),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.location_on),
                                      title: const Text("Address"),
                                      subtitle: const Text("T.I.P Housing Society Road Num 8 House Num 118/7, Haripur, Pakistan"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/user.png',
                          color: Colors.white,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    )
                  ],
                ),
        
                const SizedBox(height: 20.0),

        
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                filteredItems = items;
                              } else {
                                filteredItems = items
                                    .where((item) => item.toLowerCase().contains(value.toLowerCase()))
                                    .toList();
                              }
                            });
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search here...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        // Shopping cart icon action here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/shopping-cart.png',
                          color: Colors.black,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 20.0),
        
                Text('Explore',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        
                SizedBox(height: 20,),
        
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                    //   Container(
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Stack(
                    //           children: [
                    //             Container(
                    //               width: double.infinity,
                    //               height: 150,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    //                 image: DecorationImage(
                    //                   image: AssetImage('assets/sofa1.png'),
                    //                   fit: BoxFit.contain,
                    //                 ),
                    //               ),
                    //             ),
                    //             Positioned(
                    //               top: 10,
                    //               right: 10,
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     favoriteStates[0] = !favoriteStates[0]; // Toggle the state of the first icon
                    //                   });
                    //                 },
                    //                 child: Icon(
                    //                   favoriteStates[0] ? Icons.favorite : Icons.favorite_border,
                    //                   color: favoriteStates[0] ? Colors.red : Colors.grey,
                    //                   size: 24,
                    //                 ),
                    //               ),
                    //             ),
                    //
                    //           ],
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(12.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "English Roll Arm sofa",
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 5),
                    //               Text(
                    //                 "A comfortable sofa that transforms into a bed, with luxurious padding and a sleek design.",
                    //                 style: TextStyle(
                    //                   fontSize: 12,
                    //                   color: Colors.grey[600],
                    //                 ),
                    //               ),
                    //               SizedBox(height: 10),
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Text(
                    //                     "\$2000.00",
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.green,
                    //                     ),
                    //                   ),
                    //                   ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                       backgroundColor: Colors.black,
                    //                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //                       shape: RoundedRectangleBorder(
                    //                         borderRadius: BorderRadius.circular(8),
                    //                       ),
                    //                     ),
                    //                     onPressed: () {},
                    //                     child: Icon(
                    //                       Icons.add,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    //   SizedBox(width: 20,),
                    //   Container(
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Stack(
                    //           children: [
                    //             Container(
                    //               width: double.infinity,
                    //               height: 150,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    //                 image: DecorationImage(
                    //                   image: AssetImage('assets/sofa2.png'),
                    //                   fit: BoxFit.contain,
                    //                 ),
                    //               ),
                    //             ),
                    //             Positioned(
                    //               top: 10,
                    //               right: 10,
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     favoriteStates[1] = !favoriteStates[1]; // Toggle the state of the first icon
                    //                   });
                    //                 },
                    //                 child: Icon(
                    //                   favoriteStates[1] ? Icons.favorite : Icons.favorite_border,
                    //                   color: favoriteStates[1] ? Colors.red : Colors.grey,
                    //                   size: 24,
                    //                 ),
                    //               ),
                    //             ),
                    //
                    //           ],
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(12.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Divan",
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 5),
                    //               Text(
                    //                 "A comfortable sofa that transforms into a bed, with luxurious padding and a sleek design.",
                    //                 style: TextStyle(
                    //                   fontSize: 12,
                    //                   color: Colors.grey[600],
                    //                 ),
                    //               ),
                    //               SizedBox(height: 10),
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Text(
                    //                     "\$2000.00",
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.green,
                    //                     ),
                    //                   ),
                    //                   ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                       backgroundColor: Colors.black,
                    //                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //                       shape: RoundedRectangleBorder(
                    //                         borderRadius: BorderRadius.circular(8),
                    //                       ),
                    //                     ),
                    //                     onPressed: () {},
                    //                     child: Icon(
                    //                       Icons.add,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    //   SizedBox(width: 20,),
                    //   Container(
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Stack(
                    //           children: [
                    //             Container(
                    //               width: double.infinity,
                    //               height: 150,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    //                 image: DecorationImage(
                    //                   image: AssetImage('assets/sofa3.png'),
                    //                   fit: BoxFit.contain,
                    //                 ),
                    //               ),
                    //             ), // Initialize this state variable outside the widget
                    //
                    //             Positioned(
                    //               top: 10,
                    //               right: 10,
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     favoriteStates[2] = !favoriteStates[2]; // Toggle the state of the first icon
                    //                   });
                    //                 },
                    //                 child: Icon(
                    //                   favoriteStates[2] ? Icons.favorite : Icons.favorite_border,
                    //                   color: favoriteStates[2] ? Colors.red : Colors.grey,
                    //                   size: 24,
                    //                 ),
                    //               ),
                    //             ),
                    //
                    // ],
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(12.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Camelback Sofa",
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 5),
                    //               Text(
                    //                 "A comfortable sofa that transforms into a bed, with luxurious padding and a sleek design.",
                    //                 style: TextStyle(
                    //                   fontSize: 12,
                    //                   color: Colors.grey[600],
                    //                 ),
                    //               ),
                    //               SizedBox(height: 10),
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Text(
                    //                     "\$2500.00",
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.green,
                    //                     ),
                    //                   ),
                    //                   ElevatedButton(
                    //                     style: ElevatedButton.styleFrom(
                    //                       backgroundColor: Colors.black,
                    //                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //                       shape: RoundedRectangleBorder(
                    //                         borderRadius: BorderRadius.circular(8),
                    //                       ),
                    //                     ),
                    //                     onPressed: () {},
                    //                     child: Icon(
                    //                       Icons.add,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
        
                      Wrap(
                        spacing: 20,
                        children: filteredItems.map((item) {
                          return Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                        image: DecorationImage(
                                          image: AssetImage('assets/sofa${filteredItems.indexOf(item) + 1}.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            favoriteStates[filteredItems.indexOf(item)] = !favoriteStates[filteredItems.indexOf(item)];
                                          });
                                        },
                                        child: Icon(
                                          favoriteStates[filteredItems.indexOf(item)] ? Icons.favorite : Icons.favorite_border,
                                          color: favoriteStates[filteredItems.indexOf(item)] ? Colors.red : Colors.grey,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item, // Sofa name
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "A comfortable sofa that transforms into a bed, with luxurious padding and a sleek design.", // Description
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$2000.00", // Price
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
        
                SizedBox(height: 20,),
        
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Selling',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100, // Adjust width as needed
                              height: 100, // Adjust height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage('assets/sofa1.png'), // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            // Right side column for text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "English Roll Arm Sofa",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "A comfortable sofa with luxurious padding.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "\$2000.00",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Arrow icon with more left padding
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0), // Adjust this value to move the icon left
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SecondScreenUi()), // Replace 'NextScreen' with the screen you want to navigate to
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
        
        
              ],
            ),
          ),
        ),
      ),

    );

  }

  // void toggleFavorite() {
  //   setState(() {
  //     isFavorite = !isFavorite; // Toggle the favorite state
  //   });
  // }
}
