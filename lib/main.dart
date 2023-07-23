import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/presentation/mainpage/screen_main.dart';

import 'core/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: backgroundcolor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: ScreenMain(),
    );
  }
}
