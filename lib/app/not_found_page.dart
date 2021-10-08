import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(),
          Text(
            "Error 404",
            style: TextStyle(fontSize: 26),
          ),
          Icon(
            Icons.error_outline,
            size: 56,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
