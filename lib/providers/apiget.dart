import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/pages/page3.dart';
import 'foodprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FoodProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search for food',
            ),
            onChanged: (query) {
              context.read<FoodProvider>().search(query);
            },
          ),
        ),
        body: Center(
          child: Consumer<FoodProvider>(
            builder: (context, provider, child) {
              if (provider.getData != null) {
                return ListView.builder(
                    itemCount: provider.getData!["items"].length,
                    itemBuilder: (BuildContext context, int index) {
                      String foodName =
                          provider.getData!["items"][index]["name"];
                      double foodCalorie =
                          provider.getData!["items"][index]["calories"];

                      double foodSize =
                          provider.getData!["items"][index]["serving_size_g"];

                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(20)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${capitalize(foodName)}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calories: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${foodCalorie} - ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Serving Size: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "${foodSize} ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ]),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                      // return Text("${provider.data!["items"][index]}");
                    });
              } else {
                return Column(
                  children: [Text("Type your food")],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
