import 'package:flutter/material.dart';
import 'package:llapreview/services/firestore.dart';
import 'package:llapreview/services/models.dart';
import 'package:llapreview/shared/bottom_nav.dart';
import 'package:llapreview/shared/loading.dart';
import 'package:llapreview/shared/error.dart';

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
            appBar: AppBar(title: Text('Topics')),
            body: GridView.count(
              crossAxisCount: 2,
              children: List.generate(100, (index) {
                return Center(
                  child: Text('Item $index'),
                );
              }),
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        } else {
          return const Text('No topics found. Check database.');
        }
      },
    );
  }
}
