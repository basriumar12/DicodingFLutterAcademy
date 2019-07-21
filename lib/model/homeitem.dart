import 'dart:convert';

import 'meal.dart';

HomeItem myModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HomeItem.fromJson(jsonData);
}

class HomeItem {
  final List<Meal> meals;

  HomeItem({this.meals});

  factory HomeItem.fromJson(Map<String, dynamic> json) => new HomeItem(
    meals: new List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": new List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

