
import 'package:flutter_app/model/homeitem.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiMeal {
  Client client = Client();

  Future<HomeItem> fetchAllDataFrom(String meal) async {
    final Response response = await http.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$meal');

    if (response.statusCode == 200) {
      return myModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapatkan post');
    }
  }
}