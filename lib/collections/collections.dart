import 'package:flutter/material.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:provider/provider.dart';
import 'package:llapreview/services/services.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Counter>().fetchCollections(); // start fetching the data now?

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: Colors.orange[800],
      ),
      body: Text('zzzzzzzzz'),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
