import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';

class Username extends StatelessWidget {
   Username({super.key, required this.username,});
   



  String username;
  @override
  Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Text(
          '$username'.tr(),
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,  color: isDarkMode ? Colors.white : Colors.black,),
        );
  }
}