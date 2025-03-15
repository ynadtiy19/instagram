import 'package:flutter/material.dart';
import 'package:instgram_app/data/data_favourit_model.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/DataFavourit.dart';
import 'package:instgram_app/ui/widget/username.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
   FavoritePage({super.key});
final List<DataFavouritModel>dataModel =  const[
    DataFavouritModel(name: 'New', heightt: 300),
    DataFavouritModel(name: 'This Week', heightt: 400),
  DataFavouritModel(name: 'This Month', heightt: 600),
  ];
  @override
  Widget build(BuildContext context) {
           final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:     isDarkMode ? Colors.black : Colors.white,
        title: Username(
          username: 'mohamed_elansary',
        ),
      ),
      body: ListView.builder(
        itemCount: dataModel.length,
        itemBuilder: (context, index) {

return Data(model: dataModel[index]);

        },
      ),
    );
  }
}
