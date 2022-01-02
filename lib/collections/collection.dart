import 'package:flutter/material.dart';
import 'package:llapreview/services/models.dart';

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
        // QuizList(topic: topic),
      ]),
    );
  }
}
