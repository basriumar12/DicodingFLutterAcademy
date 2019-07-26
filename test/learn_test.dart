import 'package:flutter_app/api_meal.dart';
import 'package:flutter_app/model/homeitem.dart';
import 'package:flutter_app/model/meal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class LearnTest extends Mock implements http.Client {}

main() {
  final client = LearnTest();
  ApiMeal apiMeal = new ApiMeal();

  group("Seafood test", () {
    test("request complete", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response(HomeItem().toString(), 200),
      );

      expect(await apiMeal.fetchAllDataFrom("Dessert"), isA<HomeItem>());
    });
  });
}