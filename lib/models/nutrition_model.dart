class NutritionModel {
  String? name;
  double? calories;
  double? servingSizeG;
  double? fatTotalG;
  double? proteinG;
  int? cholesterolMg;
  double? carbohydratesTotalG;
  double? sugarG;

  NutritionModel(
      {this.name,
      this.calories,
      this.servingSizeG,
      this.fatTotalG,
      this.proteinG,
      this.cholesterolMg,
      this.carbohydratesTotalG,
      this.sugarG});

  NutritionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calories = json['calories'];
    servingSizeG = json['serving_size_g'];
    fatTotalG = json['fat_total_g'];
    proteinG = json['protein_g'];
    cholesterolMg = json['cholesterol_mg'];
    carbohydratesTotalG = json['carbohydrates_total_g'];
    sugarG = json['sugar_g'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['calories'] = this.calories;
    data['serving_size_g'] = this.servingSizeG;
    data['fat_total_g'] = this.fatTotalG;
    data['protein_g'] = this.proteinG;
    data['cholesterol_mg'] = this.cholesterolMg;
    data['carbohydrates_total_g'] = this.carbohydratesTotalG;
    data['sugar_g'] = this.sugarG;
    return data;
  }
}
