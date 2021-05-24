import 'package:flutter/services.dart';
import 'package:killed_by_google/app/services/graveyard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Cache(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  Future<List<Graveyard>> getDataFromAssets() async {
    final response = await rootBundle.loadString('assets/json/graveyard.json');
    return graveyardFromJson(response);
  }

  Future<void> updateData() async {}
}
