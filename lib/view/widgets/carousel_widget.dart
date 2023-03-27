import 'package:carousel_slider/carousel_slider.dart';
import 'package:example/view/widgets/percent_indicator2.dart';
import 'package:example/view/widgets/percent_indicator3.dart';
import 'package:example/view/widgets/percent_indicator4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var items = [];
    List<Widget> ContainerList = [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PieChartWidget2(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 265,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)),
                child: const Center(
                  child: Text(
                    "You reached this percentage of your goals! Don't Give UP!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PieChartWidget3(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 265,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)),
                child: const Center(
                  child: Text(
                    "You reached this percentage of your goals! Don't Give UP!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PieChartWidget4(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 265,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)),
                child: const Center(
                  child: Text(
                    "You reached this percentage of your goals! Don't Give UP!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ];

    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: ContainerList.map((container) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: container,
            );
          },
        );
      }).toList(),
    );
  }
}
