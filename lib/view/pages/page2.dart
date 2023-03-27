import 'package:example/view/widgets/appbar_custom.dart';
import 'package:example/view/widgets/main_screen_bottomwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:example/providers/search_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/carousel_widget.dart';
import '../widgets/main_screen_percentIndicator.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

  @override
  var items = ["Text", " deneme", "2222"];
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "My Process",
              style: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 9,
            ),
            PieChartWidget(),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "My Goals",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                  CarouselWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // BottomWidget(),
            Container(
              height: 150,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.amber),
              child: ListView.builder(
                itemCount: searchProvider.nutritions.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.transparent,
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              child: Text(
                                searchProvider.nutritions[index].name!,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
