import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talipafast/components/items.dart';
import 'package:talipafast/models/cart.dart';
import 'package:talipafast/models/data.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Adding DATA
  void addDataToCart(DataDetails dataDetails) {
    Provider.of<Cart>(context, listen: false).addItemToCart(dataDetails);

    // NOTIFIER
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Succussfully added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          const SizedBox(height: 50),
          //Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color: Colors.grey)),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),

          const SizedBox(height: 25),
          // new release
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: const [
                Text(
                  'New release',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),
          // Contents of /\

          // List of data
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DataDetails dataDetails = value.getDataList()[index];

                return Items(
                  dataDetails: dataDetails,
                  onTap: () => addDataToCart(dataDetails),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 10, right: 10),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
