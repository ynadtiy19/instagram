import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class moreText extends StatelessWidget {
  const moreText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "more".tr(),
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
