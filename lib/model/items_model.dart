
import 'package:uuid/uuid.dart';

class ItemModel {
  final String id;
  final String type;
  final String path;
  final String itemName;
  final double price;
  final double rating;
  final bool isDiscounted;
  final double discountPrice;
  ItemModel({
    required this.path,
    required this.type,
    required this.itemName,
    required this.price,
    required this.rating,
    required this.isDiscounted,
    required this.discountPrice,
  }) : id = const Uuid().v4();


}
