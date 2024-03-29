import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/collections/collection.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Counter>().fetchCollections(); // start fetching the data now?

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: Colors.orange.shade900,
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.user,
              color: Colors.white60,
            ),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          )
        ],
      ),
      body: const CollectionList(),
    );
  }
}

class CollectionList extends StatelessWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state
    final collections = context.watch<Counter>().collections;

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: collections
          .map((collection) => CollectionItem(collection: collection))
          .toList(),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final Collection collection;
  const CollectionItem({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: collection.title,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    CollectionScreen(collection: collection),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                    // child: Image.asset(
                    //   // 'assets/covers/${collection.img}',
                    //   'assets/covers/placeholder.png',
                    //   fit: BoxFit.contain,
                    // ),
                    // child: Placeholder(),
                    ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    collection.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.fade,
                    // overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ),
              Flexible(
                child: CollectionProgress(collection: collection),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
