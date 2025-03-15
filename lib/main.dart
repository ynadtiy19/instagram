// // import 'package:easy_localization/easy_localization.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:instgram_app/ui/screans/splach_screan.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   await EasyLocalization.ensureInitialized();
// //    SharedPreferences prefs = await SharedPreferences.getInstance();
// //   String locale = prefs.getString('locale') ?? 'en';
// //   runApp(
// //     EasyLocalization(
// //         supportedLocales: [Locale('en'), Locale('ar')],
// //         path:
// //             'assets/translations', // <-- change the path of the translation files
// //         fallbackLocale: Locale('en'),
// //         child: test()),
// //   );
// // }

// // class test extends StatelessWidget {
// //   const test({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       localizationsDelegates: context.localizationDelegates,
// //       supportedLocales: context.supportedLocales,
// //       locale: context.locale,
// //       debugShowCheckedModeBanner: false,
// //       home: splashScreen(),
// //     );
// //   }
// // }




// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'package:instgram_app/ui/dark/theme_provider.dart';
// import 'package:instgram_app/ui/screans/splach_screan.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await EasyLocalization.ensureInitialized();
// await Supabase.initialize(
//     url: "https://jiymtjcereeyvqmmrqam.supabase.co",
//     anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppeW10amNlcmVleXZxbW1ycWFtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5NDMwNzAsImV4cCI6MjA1NjUxOTA3MH0.Fmpjw9geQ4x87exQt1l7x2D--AprVARsB9zZOS61T9k",
//   );
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String locale = prefs.getString('locale') ?? 'en';

//   runApp(
//     EasyLocalization(
//       supportedLocales: const [Locale('en'), Locale('ar')],
//       path: 'assets/translations',
//       fallbackLocale: const Locale('en'),
//       startLocale: Locale(locale),
//       child: ChangeNotifierProvider(
//         create: (context) => ThemeProvider()..loadTheme(),
//         child: const MyApp(),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       title: "Instagram App",
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: themeProvider.themeMode, // تطبيق الوضع الداكن على مستوى التطبيق
//       home:  splashScreen(),
//     );
//   }
// }



import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/screans/splach_screan.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // انتظار جميع عمليات التهيئة دفعة واحدة
  await Future.wait([
    Firebase.initializeApp(),
    EasyLocalization.ensureInitialized(),
    Supabase.initialize(
      url: "https://jiymtjcereeyvqmmrqam.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppeW10amNlcmVleXZxbW1ycWFtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5NDMwNzAsImV4cCI6MjA1NjUxOTA3MH0.Fmpjw9geQ4x87exQt1l7x2D--AprVARsB9zZOS61T9k",
    ),
  ]);

  // تحميل اللغة المحفوظة في `SharedPreferences`
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String locale = prefs.getString('locale') ?? 'en';

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(locale),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()..loadTheme()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: "Instagram App",
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode, // دعم الوضع الداكن
          home: const splashScreen(),
        );
      },
    );
  }
}



