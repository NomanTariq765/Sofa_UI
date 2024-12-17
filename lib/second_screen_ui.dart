import 'package:flutter/material.dart';
import 'package:sofa_ui/first_screen_ui.dart';
import 'package:sofa_ui/third_screen_ui.dart';

class SecondScreenUi extends StatelessWidget {
  const SecondScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreenUi()));
                        },
                        child: Icon(Icons.arrow_back, size: 28, color: Colors.black)),
                    Text("Product",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Icon(Icons.shopping_cart, size: 28, color: Colors.black),
                  ],
                ),
                SizedBox(height: 24),
                // Chair Image
                Center(
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/sofa1.png'), // Add your asset
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Product Details
                Text(
                  "\$2000.00",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Minimal Chair",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.amber),
                        Icon(Icons.star, size: 20, color: Colors.amber),
                        Icon(Icons.star, size: 20, color: Colors.amber),
                        Icon(Icons.star, size: 20, color: Colors.amber),
                        Icon(Icons.star, size: 20, color: Colors.amber),
                        Text(
                          " 5",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),

                SizedBox(height: 16),
                // Color Options
                Text(
                  "Color option",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ColorOption(color: Colors.red),
                    ColorOption(color: Colors.black),
                    ColorOption(color: Colors.grey),
                  ],
                ),
                SizedBox(height: 24),
                // Description
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "A comfortable sofa that transforms into a bed, with luxurious padding and a sleek design.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 50),
                // Add to Cart Button
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreenUi()));
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 4),
      ),
    );
  }
}
