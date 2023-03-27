import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodProvider extends ChangeNotifier {
  String _query = '';
  Map<String, dynamic>? _data;

  String get query => _query;
  Map<String, dynamic>? get getData => _data;

  Future<void> search(String query) async {
    _query = query;
    _data = null;

    try {
      final response = await http.get(
        Uri.parse('https://api.calorieninjas.com/v1/nutrition?query=$_query'),
        headers: {'X-Api-Key': 'wVq+dj+Iw/NJMvQ2e0+bzw==RiYgGWzn7W3eGg1a'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('items') && data['items'].isNotEmpty) {
          _data = data;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    notifyListeners();
  }
}
