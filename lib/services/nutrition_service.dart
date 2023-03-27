import 'dart:convert';

// import 'package:firebase_test/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/nutrition_model.dart';

class ApiConfig {
  static ApiConfig shared = ApiConfig();
  String token = "";
}

String getUrl(String query) {
  return _baseUrl + query;
}

const String _baseUrl = "https://api.calorieninjas.com/v1/nutrition?query=";

Future<List<NutritionModel>> getNutrition(String query) async {
  http.Response response = await http.get(
    getUrl(query) as Uri,
    headers: {'X-Api-Key': '7Z1IyEgbfDbsjl/PrPkXYg==H4DiX5kBiMSVP1iy'},
  );

  List<NutritionModel> foods = [];
  var data = jsonDecode(response.body);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    for (var i = 0; i < data["items"].length; i++) {
      NutritionModel nutrition = NutritionModel.fromJson(data["items"][i]);
      foods.add(nutrition);
    }
  }
  return foods;
}


// import 'dart:convert';

// // import 'package:firebase_test/models/user_model.dart';
// import 'package:http/http.dart' as http;

// import '../models/nutrition_models.dart';

// class ApiConfig {
//   static ApiConfig shared = ApiConfig();
//   String token = "";
// }

// String getUrl(String query) {
//   return _baseUrl + query;
// }

// const String _baseUrl = "https://api.calorieninjas.com/v1/nutrition?query=";

// Future<List<NutritionModels>> getNutrition(String query) async {
//   http.Response response = await http.get(
//     getUrl(query) as Uri,
//     headers: {'X-Api-Key': '7Z1IyEgbfDbsjl/PrPkXYg==H4DiX5kBiMSVP1iy'},
//   );

//   List<NutritionModels> foods = [];
//   var data = jsonDecode(response.body);
//   if (response.statusCode >= 200 && response.statusCode < 300) {
//     for (var i = 0; i < data["items"].length; i++) {
//       NutritionModels nutrition = NutritionModels.fromJson(data["items"][i]);
//       foods.add(nutrition);
//     }
//   }
//   return foods;
// }
