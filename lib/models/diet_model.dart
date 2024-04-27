import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calories,
      required this.boxColor,
      required this.viewIsSelected});

  static List<DietModel> getDiet() {
    List<DietModel> Diets = [];
    Diets.add(DietModel(
      name: 'Honey Pancake',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '30 min',
      calories: '180 kcal',
      boxColor: Color(0xFF92A3FD),
      viewIsSelected: true,
    ));
    Diets.add(DietModel(
      name: 'Canai Bread',
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20 min',
      calories: '230 kcal',
      boxColor: Color(0xFFC588F2),
      viewIsSelected: false,
    ));
    return Diets;
  }
}
