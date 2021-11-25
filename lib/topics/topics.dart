import 'package:flutter/material.dart';
import 'package:llapreview/shared/bottom_nav.dart';

class Topics extends StatelessWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics')),
      body: (Container(
        child: Column(
          children: [
            Text('Topics'),
            ElevatedButton(
              onPressed: () => print('Yo'),
              child: Text("Yo"),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
