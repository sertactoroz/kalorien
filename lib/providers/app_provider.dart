import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  int pageIndex = 0;

  changeIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
