// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/constants/constants.dart';
import 'package:example/view/widgets/custom_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example/page_operator.dart';
import 'package:example/view/pages/page2.dart';
import 'package:example/view/widgets/appbar_custom.dart';

import '../../models/nutrition_model.dart';
import '../../providers/foodprovider.dart';
import '../../providers/search_provider.dart';

class Page3 extends StatelessWidget {
  final Function onPageChange;
  Page3({
    Key? key,
    required this.onPageChange,
  }) : super(key: key);

  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food',
                ),
                onChanged: (query) {
                  context.read<FoodProvider>().search(query);
                },
              ),
            ),
            Consumer<FoodProvider>(
              builder: (context, provider, child) {
                if (provider.getData != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 2.9 / 4,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(), // Set the physics to disable scrolling

                        itemCount: provider.getData!["items"].length,
                        itemBuilder: (BuildContext context, int index) {
                          String foodName = provider.getData!["items"][index]["name"];
                          double foodCalorie = provider.getData!["items"][index]["calories"];
                          double foodFat = provider.getData!["items"][index]["fat_total_g"];
                          int foodCholesterol = provider.getData!["items"][index]["cholesterol_mg"];
                          double foodProtein = provider.getData!["items"][index]["protein_g"];

                          return Container(
                            height: MediaQuery.of(context).size.height * 2.9 / 4,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[100],
                                  // color: Colors.grey[200],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                faker.image.image(
                                                  keywords: ['$foodName'],
                                                ).toString(),
                                              ),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop)),
                                        ),

                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                                                  height: 90,
                                                  child: Column(children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Center(
                                                        child: Text(
                                                          "${capitalize(foodName)}",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                              NutritionCategoryCreator('Calories'),
                                                              NutritionCategoryCreator('Fat'),
                                                              NutritionCategoryCreator('Cholesterol'),
                                                              NutritionCategoryCreator('Protein'),
                                                            ]),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                              NutritionTextCreator(foodCalorie),
                                                              NutritionTextCreator(foodFat),
                                                              NutritionTextCreator(foodCholesterol),
                                                              NutritionTextCreator(foodProtein),
                                                            ]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: CustomButton1(
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          FocusScope.of(context).unfocus();
                                                          for (var item in provider.getData!["items"]) {
                                                            context.read<SearchProvider>().addNutrition(NutritionModel.fromJson(item));
                                                          }
                                                          onPageChange();
                                                        },
                                                        text: 'Add',
                                                        textColor: greenCustom,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // your content goes here
                                      ),
                                    ),
                                    // SizedBox(height: MediaQuery.of(context).size.height * 1 / 3.7)
                                  ],
                                ),
                              ),
                            ),
                          );
                          // return Text("${provider.data!["items"][index]}");
                        }),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Text("Type your food"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Text NutritionCategoryCreator(String e) {
    return Text("$e",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ));
  }

  Text NutritionTextCreator(dynamic e) => Text(
        "${e} ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.normal,
        ),
      );
}

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}
