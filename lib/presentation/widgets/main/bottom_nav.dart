import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: ((context, value, _) {
          return BottomNavigationBar(
              currentIndex: value,
              onTap: (value) {
                indexNotifier.value = value;
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(fontFamily: GoogleFonts.ptSans().fontFamily),
              unselectedLabelStyle: TextStyle(fontFamily: GoogleFonts.ptSans().fontFamily),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: "New & Hot"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: "Downloads"),
              ]);
        }));
  }
}
