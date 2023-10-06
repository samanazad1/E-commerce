import 'package:e_commerece/model/category_model.dart';

List<CategoryModel> _availableCategories = [
  CategoryModel(title: 'All'),
  CategoryModel(title: 'Smarphones'),
  CategoryModel(title: 'Headphones'),
  CategoryModel(title: 'Laptos'),
  CategoryModel(title: 'Consoles'),
];
List<CategoryModel> get availableCategories => _availableCategories;
