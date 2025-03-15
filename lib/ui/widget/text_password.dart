import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class TextPassword extends StatefulWidget {
  TextPassword({
    super.key,
    required this.maxLines,
    required this.minLines,
    required this.hinttext,
  });
  int maxLines;
  int minLines;
  String hinttext;
  TextEditingController passController = TextEditingController();

  @override
  State<TextPassword> createState() => _TextPasswordState();
}

class _TextPasswordState extends State<TextPassword> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.passController,
      style: TextStyle(color: Colors.black),
      obscureText: visibility == true ? false : true,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {
            visibility = !visibility;
            setState(() {});
          },
          icon: Icon(
            visibility == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
            size: 20,
          ),
        ),
        fillColor: Color(0xFFD9D9D9),
        filled: true,
        hintText: '${widget.hinttext}'.tr(),
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
