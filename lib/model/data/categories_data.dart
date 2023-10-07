import 'package:e_commerece/model/category_model.dart';

List<CategoryModel> _availableCategories = [
  CategoryModel(title: 'All'),
  CategoryModel(title: 'Smarphones'),
  CategoryModel(title: 'Laptops'),
  CategoryModel(title: 'Consoles'),
];
List<CategoryModel> get availableCategories => _availableCategories;
