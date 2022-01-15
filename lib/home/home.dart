import 'package:flutter/material.dart';
import 'package:llapreview/login/login.dart';
import 'package:llapreview/shared/shared.dart';
import 'package:llapreview/collections/collections.dart';
import 'package:llapreview/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const CollectionsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
