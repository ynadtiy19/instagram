import 'package:flutter/material.dart';

class ReturnBotton extends StatelessWidget {
  const ReturnBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ));
  }
}
