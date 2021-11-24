import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: Text('about', style: Theme.of(context).textTheme.button),
                onPressed: () => Navigator.pushNamed(context, '/about'))));
  }
}
