import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talipafast/models/cart.dart';
import 'package:talipafast/models/data.dart';

class CartItem extends StatefulWidget {
  DataDetails dataDetails;
  CartItem({
    super.key,
    required this.dataDetails,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.dataDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(
          widget.dataDetails.imagePath,
        ),
        title: Text(widget.dataDetails.name),
        subtitle: Text('\₱ ' + widget.dataDetails.price),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
