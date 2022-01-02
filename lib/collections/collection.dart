import 'package:flutter/material.dart';
import 'package:llapreview/services/models.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectionScreen extends StatelessWidget {
  final Collection collection;

  const CollectionScreen({Key? key, required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection'), // TODO: Maybe?
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
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
          ),
        ),
        // Text(
        //   collection.title,
        //   style: const TextStyle(
        //       height: 2, fontSize: 20, fontWeight: FontWeight.bold),
        // ),
        ItemList(collection: collection),
      ]),
    );
  }
}

class ItemList extends StatelessWidget {
  final Collection collection;
  const ItemList({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: collection.item_titles.map(
        (item) {
          return Card(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            elevation: 4,
            margin: const EdgeInsets.all(4),
            child: InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         QuizScreen(quizId: quiz.id),
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    item, // item.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  // subtitle: Text(
                  //   item, // item.description
                  //   overflow: TextOverflow.fade,
                  //   style: Theme.of(context).textTheme.subtitle2,
                  // ),
                  // leading: QuizBadge(topic: topic, quizId: quiz.id),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
