import 'package:flutter/material.dart';
import 'package:llapreview/login/login.dart';
import 'package:llapreview/shared/bottom_nav.dart';
import 'package:llapreview/topics/topics.dart';
import 'package:llapreview/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          } else if (snapshot.hasError) {
            return const Center(child: Text('error'));
          } else if (snapshot.hasData) {
            return const Topics();
          } else {
            return const Login();
          }
        });
  }
}
