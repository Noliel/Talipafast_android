import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talipafast/models/data.dart';

// ignore: must_be_immutable
class Items extends StatelessWidget {
  DataDetails dataDetails;
  void Function()? onTap;
  Items({super.key, required this.dataDetails, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // PICTURE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(dataDetails.imagePath),
          ),
          // Description
          Text(
            dataDetails.description,
            style: TextStyle(color: Colors.grey[600]),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // LEFT SIDE
                    Text(
                      dataDetails.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        '\₱' + dataDetails.price,
                        style: const TextStyle(
                          fontSize: (23),
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),

                // Cart button [RIGHT SIDE]
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 248, 192, 107),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )),
                      child: Icon(Icons.shopping_cart)),
                ),
              ],
            ),
          )
          // Add to Cart
        ],
      ),
    );
  }
}
