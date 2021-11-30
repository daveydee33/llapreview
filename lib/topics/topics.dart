import 'package:flutter/material.dart';
import 'package:llapreview/services/firestore.dart';
import 'package:llapreview/services/models.dart';
import 'package:llapreview/shared/bottom_nav.dart';
import 'package:llapreview/shared/loading.dart';
import 'package:llapreview/shared/error.dart';
import 'package:llapreview/topics/topic_item.dart';
import 'package:llapreview/topics/drawer.dart';

class Topics extends StatelessWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Topics'),
              backgroundColor:
                  // Colors.orange[900],
                  // Colors.deepOrange[700],
                  // Colors.deepOrange[800],
                  Colors.deepOrange[900],
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
            drawer: TopicDrawer(topics: topics),
          );
        } else {
          return const Text('No topics found. Check database.');
        }
      },
    );
  }
}
