import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/sotry_list_modell.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart' show ThemeProvider;
import 'package:provider/provider.dart';

class Yourstory extends StatelessWidget {
  Yourstory({super.key, required this.modell});
  SotryListModell modell;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Row(
      children: [
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
         
        //     Container(
        //                       decoration: BoxDecoration(
        //                         shape: BoxShape.circle,
        //                         gradient: LinearGradient(
        //                           colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
        //                           begin: Alignment.topLeft,
        //                           end: Alignment.bottomRight,
        //                         ),
        //                       ),
        //                       padding: EdgeInsets.all(3), // Border thickness
        //                       child: CircleAvatar(
        //                         radius: 40,
        //                         backgroundColor: Colors.white, // Inner white border
        //                         child: CircleAvatar(
        //                           radius: 39, // Slightly smaller to fit inside the gradient
        //                           backgroundImage: AssetImage(modell.image),
        //                         ),
        //                       ),
        //                     ),
        //     Text(
        //       modell.Text.tr(),
        //       style: TextStyle(
        //         fontSize: 18,
        //         color: isDarkMode ? Colors.white : Colors.black,
        //       ),
        //     ),
        //   ],
        // ),
        Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.orange, Colors.red, Colors.purple],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              padding: EdgeInsets.all(3), // Border thickness
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white, // Inner white border
                                child: CircleAvatar(
                                  radius: 39, // Slightly smaller to fit inside the gradient
                                  backgroundImage: AssetImage('assets/images/mohamed.jpeg'),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 2), // Border to separate it from profile pic
                                ),
                                padding: EdgeInsets.all(4), // Adjust size
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18, // Adjust icon size
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                       Text(
              modell.Text.tr(),
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
                      ],
                    ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}

