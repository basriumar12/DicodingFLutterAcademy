import 'dart:convert';

import 'meal.dart';

Detail myModelFromJson(String str) {
  final jsonData = json.decode(str);
  return Detail.fromJson(jsonData);
}

class Detail {
  final List<Meal> meals;

  Detail({this.meals});

  factory Detail.fromJson(Map<String, dynamic> json) => new Detail(
    meals: new List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": new List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}