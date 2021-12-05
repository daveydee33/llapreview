import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// import 'models/item_model.dart';
import 'dart:convert';
// import './widgets/item_list.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  late List items = [];

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void fetchItems() async {
    final res = await http
        .get(Uri.parse('http://localhost:4001/v1/items?limit=10&page=1'));
    final resItems = json.decode(res.body);
    items = resItems['results']; // or  // items = resItems;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
