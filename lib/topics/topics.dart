import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:llapreview/services/services.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:llapreview/topics/drawer.dart';
import 'package:llapreview/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

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
              backgroundColor: Colors.orange[800],
              // Colors.orange[900],
              // Colors.orangeAccent[700],
              // Colors.amber[900],
              // Colors.yellow[900],
              // Colors.deepOrange[700],
              // Colors.deepOrange[800],
              // Colors.deepOrange[900],
              title: const Text('Topics'),
              actions: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.userCircle,
                    color: Colors.white60,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          print('ERROR... no topics in firebase');
          return const Text('No topics found. Check database.');
        }
      },
    );
  }
}
