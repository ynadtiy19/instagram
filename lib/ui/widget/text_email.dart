import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class TextEmail extends StatelessWidget {
  TextEmail({super.key, 
    
    required this.maxLines,
    required this.minLines,
   required this.hinttext,

  
  });
  int maxLines;
  int minLines;
  String hinttext;
  TextEditingController emailController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      controller:emailController ,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xFFD9D9D9),
        filled: true,
        hintText: '$hinttext'.tr(),
        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    
    );
  }
}
