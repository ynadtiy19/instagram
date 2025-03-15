import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';

class PostFollowsFollowing extends StatelessWidget {
  PostFollowsFollowing({
    super.key,
    required this.numbers,
    required this.name,
  });
  int numbers;
  String name;
  @override
  Widget build(BuildContext context) {
       final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Column(
      children: [
        Text(
          '${numbers.toString()}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black, 
          ),
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black, 
          ),
        ),
      ],
    );
  }
}
