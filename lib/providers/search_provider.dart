import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/user_login.dart';
import '../models/nutrition_model.dart';

class SearchProvider with ChangeNotifier {
  addNutrition(NutritionModel nutrition) {
    nutritions.add(nutrition);
    notifyListeners();
  }

  List<NutritionModel> nutritions = [];

  List<NutritionModel> get getNutritions => nutritions;
}
