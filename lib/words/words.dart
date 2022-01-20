import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:llapreview/shared/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/widgets/item_list.dart';

class WordsScreen extends StatefulWidget {
  const WordsScreen({Key? key}) : super(key: key);

  @override
  State<WordsScreen> createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  late List allItems;
  List filteredItems = [];
  String query = '';
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    context.read<Counter>().fetchItems(); // start fetching the data now?
    allItems = context.watch<Counter>().items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Words & Phrases'),
        backgroundColor: Colors.orange.shade800,
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.search,
              color: Colors.white60,
            ),
            onPressed: () {
              setState(() {
                showSearch = !showSearch;
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ItemList(
                items: (query == '' || !showSearch) ? allItems : filteredItems),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => Visibility(
        child: SearchWidget(
          text: query,
          hintText: 'search',
          onChanged: searchItems,
        ),
        visible: showSearch,
        maintainState: true,
      );

  Widget buildBook(Item item) => ListTile(
        // leading: Image.network(
        //   book.urlImage,
        //   fit: BoxFit.cover,
        //   width: 50,
        //   height: 50,
        // ),
        title: Text(item.title),
        subtitle: Text(item.description),
      );

  void searchItems(String query) {
    final filteredItems = allItems.where((item) {
      final titleLower = item['title'].toLowerCase();
      final descriptionLower = item['description'].toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.filteredItems = filteredItems;
    });
  }
}
