import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/widgets/item_list.dart';

class CollectionScreen extends StatelessWidget {
  final Collection collection;

  const CollectionScreen({Key? key, required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<Counter>()
        .fetchItems(); // start fetching the data now?  maybe find a better place to fetch this.
    final items = context.watch<Counter>().items;

    List filteredItems =
        items.where((item) => collection.items.contains(item.title)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection'), // TODO: Maybe?
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        // TODO: Column or ListView
        children: [
          Hero(
              tag: collection.title,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  collection.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.1,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.fade,
                  // overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              )),

          // Text(
          //   collection.title,
          //   style: const TextStyle(
          //       height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          // ),

          Expanded(
            child: ItemList(items: filteredItems),
          )
        ],
      ),
    );
  }
}
