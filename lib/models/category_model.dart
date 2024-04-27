import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPatch;
  Color boxColor;
  CategoryModel({
    required this.name,
    required this.iconPatch,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPatch: 'assets/icons/salad.svg',
        boxColor: Color(0xFF92A3FD),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPatch: 'assets/icons/cake.svg',
        boxColor: Color(0xFFC588F2),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPatch: 'assets/icons/pie.svg',
        boxColor: Color(0xFF92A3FD),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Smoothie',
        iconPatch: 'assets/icons/smoothie.svg',
        boxColor: Color(0xFFC588F2),
      ),
    );

    return categories;
  }
}
