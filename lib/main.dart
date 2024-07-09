import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hottstar1/Search.dart';
import 'package:hottstar1/Splash_Screen.dart';
import 'package:hottstar1/Wrapper.dart';
import 'package:hottstar1/profile.dart';
import 'package:hottstar1/theme_provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA8e8zmcyZrlCAiESV3M99cWCLeoUfULxo",
          messagingSenderId: "1092798171686",
          projectId: "login-1bf1b",
          appId: "1:1092798171686:web:575fbaef7ead9f728774e7"
      )
  );
  runApp(
       const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) =>ThemeProvider(),
    builder: (context,_){
      final themProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: themProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: const Wrapper(),//day 4 validation
        );
  }


  );
  }


