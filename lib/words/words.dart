import 'package:flutter/material.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/widgets/item_list.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Counter>().fetchItems(); // start fetching the data now?
    final items = context.watch<Counter>().items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Words & Phrases'),
        backgroundColor: Colors.orange[800],
      ),
      body: ItemList(items: items),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
