import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: Text('about'),
                onPressed: () => Navigator.pushNamed(context, '/about'))));
  }
}
