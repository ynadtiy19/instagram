import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/screans/menu_settings.dart';
import 'package:instgram_app/ui/widget/username.dart';
import 'package:provider/provider.dart';

class NavigatorBar extends StatelessWidget {
  NavigatorBar({
    super.key,
    required this.username,
  });

  String username;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Row(
      children: [
        Username(
          username: username,
        ),
        Spacer(
          flex: 2,
        ),
        Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
            ),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 25,
            )),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MenuSettings();
                },
              ),
            );
          },
          child: Icon(
            Icons.menu_outlined,
           color: isDarkMode ? Colors.white : Colors.black,

            size: 26,
          ),
        ),
      ],
    );
  }
}
