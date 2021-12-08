import 'package:flutter/material.dart';
import 'package:llapreview/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/routes.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:llapreview/theme.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:llapreview/widgets/item_list.dart';
import 'package:llapreview/main.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Words & Phrases'),
        backgroundColor: Colors.orange[800],
      ),
      body: ItemList(),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().fetchItems(),
      ),
    );
  }
}
