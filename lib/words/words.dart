import 'package:flutter/material.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Words & Phrases'),
        backgroundColor: Colors.orange[800],
      ),
      body: const Center(
        child: Text('About this app...'),
      ),
    );
  }
}
