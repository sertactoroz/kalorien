import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../services/user_login.dart';
import '../services/user_only_login.dart';

class UserProvider with ChangeNotifier {
  Future addUser(UserModel user) async {
    await Services().postUser(user);
    notifyListeners();
  }

  bool result = false;
  List<UserModel> users = [];

  Future setUsers() async {
    users = await Services().getUsers();
    notifyListeners();
  }

  Future deleteUser(UserModel user) async {
    await Services().deleteUser(user.id!);
    setUsers();
  }

  Future updateUser(UserModel user) async {
    await Services().updateUser(user);
    await setUsers();
  }

  Future signInUser(UserModel user) async {
    result = await LoginServices().signInUser(user);
    await setUsers();
    notifyListeners();
  }
}
