class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final int type;

  Meal({ this.strMeal, this.strMealThumb, this.idMeal, this.strCategory, this.strArea, this.strInstructions, this.type });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
    );
  }

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
    "strCategory": strCategory,
    "strArea": strArea,
    "strInstructions": strInstructions
  };

  factory Meal.fromMap(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
      strInstructions: json['strInstructions'],
      type: json['type']
    );
  }

  Map<String, dynamic> toMap() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "strInstructions": strInstructions,
    "type": type
  };
}