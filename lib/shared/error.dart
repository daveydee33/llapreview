import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({Key? key, this.message = 'it broke'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ERROR...');
    return Center(
      child: Text(message),
    );
  }
}
