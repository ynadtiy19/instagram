import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  ContainerButton({
    required this.text,
    required this.heightt,
     required this.weightt,
    required this.colorContaner,
    required this.colorText,
  });
  String text;
  double heightt;
    double weightt;
  Color colorContaner;
  Color colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightt,
      width: weightt,
      decoration: BoxDecoration(
        color: colorContaner,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
              color:colorText, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
