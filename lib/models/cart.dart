import 'package:flutter/material.dart';
import 'package:talipafast/models/data.dart';

class Cart extends ChangeNotifier {
  // list of data
  List<DataDetails> dataDetails = [
    DataDetails(
        name: 'Pork Meat',
        price: '150',
        description: '1 Kilo',
        imagePath: 'lib/images/p1.png'),
    DataDetails(
        name: 'Steak Meat',
        price: '150',
        description: '1 Kilo',
        imagePath: 'lib/images/s1.png'),
    DataDetails(
        name: 'Chicken',
        price: '120',
        description: '(Breast) 1 kilo',
        imagePath: 'lib/images/c1.png'),
    DataDetails(
        name: 'Tilapia Meat',
        price: '120',
        description: '1 Kilo',
        imagePath: 'lib/images/f1.png'),
  ];
  // list of items in the cart
  List<DataDetails> userCart = [];
  // get list
  List<DataDetails> getDataList() {
    return dataDetails;
  }

  // get cart
  List<DataDetails> getUserCart() {
    return userCart;
  }

  // adding
  void addItemToCart(DataDetails dataDetails) {
    userCart.add(dataDetails);
    notifyListeners();
  }

  // remove
  void removeItemFromCart(DataDetails dataDetails) {
    userCart.remove(dataDetails);
    notifyListeners();
  }
}
