class PopularDietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;

  PopularDietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calories,
      required this.viewIsSelected});

  static List<PopularDietModel> getPopularDiet() {
    List<PopularDietModel> popularDiets = [];

    popularDiets.add(PopularDietModel(
      name: 'Blueberry Pancake',
      iconPath: 'assets/icons/blueberry-pancake.svg',
      level: 'Medium',
      duration: '30 min',
      calories: '230 kcal',
      viewIsSelected: true,
    ));
    popularDiets.add(PopularDietModel(
      name: 'Salmon Nigiri',
      iconPath: 'assets/icons/salmon-nigiri.svg',
      level: 'Easy',
      duration: '20 min',
      calories: '120 kcal',
      viewIsSelected: false,
    ));
    return popularDiets;
  }
}
