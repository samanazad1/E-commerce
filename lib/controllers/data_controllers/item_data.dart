import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece/model/data/item_data.dart';
import 'package:e_commerece/model/models/items_model.dart';
import 'package:flutter/material.dart';

class GetItems extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance.collection('Items').doc('Items');

  List<ItemModel> allAvailableItems = availableItems;
  List<ItemModel> smartPhones = availableItems
      .where((element) => element.type.contains('smartphone'))
      .toList();
  List<ItemModel> laptops = availableItems
      .where((element) => element.type.contains('laptop'))
      .toList();
  List<ItemModel> tv =
      availableItems.where((element) => element.type.contains('tv')).toList();
  List<ItemModel> consoles = availableItems
      .where((element) => element.type.contains('console'))
      .toList();

}
