import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:llapreview/services/models.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  late List items = [];
  late List collections = [];

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void fetchItems() async {
    final client = Client();

    try {
      final res = await client
          .get(Uri.parse('http://localhost:4001/v1/items?limit=10&page=1'));
      final resItems = json.decode(res.body);
      items = resItems['results']; // or  // items = resItems;
      notifyListeners();
    } catch (e) {
      print('Error fetching Items'); // API server offline, etc.
      print(e);
    }
  }

  void fetchCollections() async {
    final client = Client();

    try {
      final res = await client.get(Uri.parse(
          'http://localhost:4001/v1/collections?limit=1000&page=1&sortBy=createdAt:desc')); // TODO: change limit and sort
      final response = json.decode(res.body);
      var responseResults = response['results']; // or  // items = resItems;
      collections = responseResults.map((d) => Collection.fromJson(d)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching Items'); // API server offline, etc.
      print(e);
    }
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
