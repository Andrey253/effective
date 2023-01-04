import 'package:effective/model/category.dart';

abstract class Repository {
  List<Category> listCategory = [];

  String city = '';
  List<String> listCity = [];
}
