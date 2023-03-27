import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiConfig {
  static ApiConfig shared = ApiConfig();
  String token = "";
}

const String _baseUrl =
    "https://kalorien-tracker-default-rtdb.europe-west1.firebasedatabase.app/";
Uri getAuthUrl(String param) => Uri.parse(
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB_S_wU5BXr0ktDrL7r7IGo9Gp0hpGgov8");

class LoginServices {
  Future<bool> signInUser(UserModel user) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB_S_wU5BXr0ktDrL7r7IGo9Gp0hpGgov8"),
        body: json.encode(user.toMap()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["registered"];
    }
    return false;
  }
}
