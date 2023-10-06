class ItemModel {
  final String path;
  final String itemName;
  final double price;
  final double rating;
  final double isDiscounted;
  final double discountPrice;
  const ItemModel({
    required this.path,
    required this.itemName,
    required this.price,
    required this.rating,
    required this.isDiscounted,
    required this.discountPrice,
  });
}