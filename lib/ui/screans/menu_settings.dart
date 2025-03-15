import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Settings and Activity'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ).tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              ListTile(
                title: Text(
                  'Your account'.tr(),
                ).tr(),
                subtitle: Text(
                  'Password, security, personal details, ad preferences'.tr(),
                ).tr(),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to account settings
                },
              ),
              SizedBox(height: 16),
              Text(
                'How you use Instagram'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ).tr(),
              SizedBox(height: 8),
              ListTile(
                title: Text(
                  'save'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ).tr(),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to saved items
                },
              ),
              ListTile(
                title: Text(
                  'language'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ).tr(),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 150,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Container(
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.black
                                    : Colors.white, // تغيير لون الخلفية
                                borderRadius: BorderRadius.circular(
                                    10), // إضافة حواف دائرية
                              ),
                              //margin: EdgeInsets.symmetric(
                              //   vertical: 5, horizontal: 10), //
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    textColor: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    // tileColor:    isDarkMode ? Colors.black : Colors.black,
                                    //  selectedTileColor: isDarkMode ? Colors.black : Colors.black,
                                    //   selectedColor:isDarkMode ? Colors.black : Colors.black ,
                                    leading: Text(
                                      'En'.tr(),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    title: Text(
                                      'English'.tr(),
                                      style: TextStyle(),
                                    ).tr(),
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString('locale', 'en');
                                      context.setLocale(Locale('en')).then((v) {
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                  ListTile(
                                    textColor: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    leading: Text(
                                      'Ar'.tr(),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    title: Text(
                                      'Arabic'.tr(),
                                      style: TextStyle(),
                                    ).tr(),
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString('locale', 'ar');
                                      context.setLocale(Locale('ar')).then((v) {
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )),
                          ),
                        );
                      });
                },
              ),
              ListTile(
                title: Text(
                  'Light & Dark mode'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
             

                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          height: 150,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.black
                                    : Colors.white, 
                                borderRadius: BorderRadius.circular(
                                    10), 
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    textColor: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    trailing: Switch(
                                      value: themeProvider.themeMode ==
                                          ThemeMode.dark,
                                      onChanged: (value) {
                                        themeProvider.toggleTheme();
                                      },
                                    ),
                                    leading: Text(
                                      'Light & Dark mode'.tr(),
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 15),
                                    ),
                                    onTap: () {
                                       Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
               ListTile(
                title: Text(
                  'Archive'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to activity
                },
              ),
              ListTile(
                title: Text(
                  'Your activity'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to activity
                },
              ),
              ListTile(
                title: Text(
                  'Notifications'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to notifications
                },
              ),
              ListTile(
                title: Text(
                  'Time management'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to time management
                },
              ),
              SizedBox(height: 16),
              Text(
                'Who can see your content'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                title: Text(
                  'Account privacy'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Private'.tr(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to account privacy
                },
              ),
              ListTile(
                title: Text(
                  'Close Friends'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('0'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to close friends
                },
              ),
              ListTile(
                title: Text(
                  'Crossposting'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('20'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to crossposting
                },
              ),
              ListTile(
                title: Text(
                  'Blocked'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to blocked users
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class MenuSettings extends StatefulWidget {
//   @override
//   _MenuSettingsState createState() => _MenuSettingsState();
// }

// class _MenuSettingsState extends State<MenuSettings> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> settingsList = [
//     {'title': 'Your account', 'subtitle': 'Password, security, personal details, ad preferences'},
//     {'title': 'save'},
//     {'title': 'language'},
//     {'title': 'Archive'},
//     {'title': 'Your activity'},
//     {'title': 'Notifications'},
//     {'title': 'Time management'},
//     {'title': 'Account privacy', 'subtitle': 'Private'},
//     {'title': 'Close Friends', 'subtitle': '0'},
//     {'title': 'Crossposting', 'subtitle': '20'},
//     {'title': 'Blocked'},
//   ];

//   List<Map<String, dynamic>> filteredList = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredList = settingsList;
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   // Update the filteredList based on the search query
//   void _onSearchChanged() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredList = settingsList
//           .where((setting) =>
//               setting['title'].toString().toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'Settings and Activity'.tr(),
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search settings...'.tr(),
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           // List of settings
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredList.length,
//               itemBuilder: (context, index) {
//                 final setting = filteredList[index];
//                 return ListTile(
//                   title: Text(setting['title'].tr()),
//                   subtitle: setting.containsKey('subtitle')
//                       ? Text(setting['subtitle'].tr())
//                       : null,
//                   trailing: Icon(Icons.arrow_forward_ios),
//                   onTap: () {
//                     // Add navigation or functionality here
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
