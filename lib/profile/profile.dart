import 'package:flutter/material.dart';
import 'package:llapreview/services/auth.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ElevatedButton(
          child: Text('Sign Out'),
          onPressed: () async {
            await AuthService().logout();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ));
  }
}
