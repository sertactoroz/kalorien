// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for food',
              ),
              onChanged: (query) {
                context.read<FoodProvider>().search(query);
              },
            ),
            Consumer<FoodProvider>(
              builder: (context, provider, child) {
                if (provider.getData != null) {
                  return Container(
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: provider.getData!["items"].length,
                          itemBuilder: (BuildContext context, int index) {
                            String foodName = provider.getData!["items"][index]["name"];
                            double foodCalorie = provider.getData!["items"][index]["calories"];
                            double foodFat = provider.getData!["items"][index]["fat_total_g"];
                            int foodCholesterol = provider.getData!["items"][index]["cholesterol_mg"];
                            double foodProtein = provider.getData!["items"][index]["protein_g"];

                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
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

                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black.withOpacity(0.5),
                                                        borderRadius: BorderRadius.circular(10)),
                                                    height: 90,
                                                    child: Center(
                                                      child: Text(
                                                        "${capitalize(foodName)}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                      Text("Calories:  ", style: TextStyle(fontSize: 16)),
                                                      Text("fat:   ", style: TextStyle(fontSize: 16)),
                                                      Text("Cholesterol:   ", style: TextStyle(fontSize: 16)),
                                                      Text("Protein:   ", style: TextStyle(fontSize: 16)),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                  Text("${foodCalorie} ", style: TextStyle(fontSize: 16)),
                                                  Text("${foodFat} ", style: TextStyle(fontSize: 16)),
                                                  Text("${foodCholesterol} ", style: TextStyle(fontSize: 16)),
                                                  Text("${foodProtein} ", style: TextStyle(fontSize: 16)),
                                                ]),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TextButton(
                                                  onPressed: () {
                                                    FocusScope.of(context).unfocus();
                                                    for (var item in provider.getData!["items"]) {
                                                      context.read<SearchProvider>().addNutrition(NutritionModel.fromJson(item));
                                                    }
                                                    onPageChange();
                                                  },
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // your content goes here
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            // return Text("${provider.data!["items"][index]}");
                          }),
                    ),
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
}

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}
