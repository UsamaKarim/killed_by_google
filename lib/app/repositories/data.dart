import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:killed_by_google/app/services/api.dart';
import 'package:killed_by_google/app/services/caching.dart';
import 'package:killed_by_google/app/services/graveyard_model.dart';

class Data {
  Data({
    @required this.api,
    @required this.cache,
  });

  final API api;
  final Cache cache;

  // List<Graveyard> graveyard = [];

  Future<List<Graveyard>> dataList() async {
    return await api.getDataFromURL();
  }
}
