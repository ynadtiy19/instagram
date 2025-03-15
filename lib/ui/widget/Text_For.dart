import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';

class TextFor extends StatelessWidget {
  TextFor({
    super.key,
    required this.maxLines,
    required this.minLines,
    required this.hintext,
    required this.firstTextt,
    required this.weightt,
  });
  int maxLines;
  int minLines;
  String? hintext;
  double weightt;
  String? firstTextt;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Center(
            child: Text(
              "$firstTextt : ",
              style: TextStyle(
                fontSize: 22,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: weightt,
          ),
          Expanded(
            child: TextFormField(
              maxLines: maxLines,
              minLines: minLines,
              controller: textController,
              style: TextStyle( color: isDarkMode ? Colors.white : Colors.black, fontSize: 20),
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(242, 214, 241, 0.08),
                filled: true,
                hintText: "$hintext",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
               
              ),
            ),
          ),
        ],
      ),
    );
  }
}
