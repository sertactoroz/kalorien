import 'package:example/appinit.dart';
import 'package:example/providers/app_provider.dart';
import 'package:example/providers/foodprovider.dart';
import 'package:example/providers/search_provider.dart';
import 'package:example/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AppProvider>(create: (_) => AppProvider()),
        ListenableProvider<SearchProvider>(create: (_) => SearchProvider()),
        ListenableProvider<FoodProvider>(create: (context) => FoodProvider()),
        ListenableProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kalorien',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const AppInit(),
      ),
    );
  }
}
