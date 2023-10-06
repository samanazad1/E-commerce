import 'package:uuid/uuid.dart';

class CategoryModel {
  final String title;
  final String id;
  CategoryModel({required this.title}) : id = const Uuid().v4();
  
}
