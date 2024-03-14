import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talipafast/components/cart_item.dart';
import 'package:talipafast/models/cart.dart';
import 'package:talipafast/models/data.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  DataDetails individualData = value.getUserCart()[index];

                  return CartItem(
                    dataDetails: individualData,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
