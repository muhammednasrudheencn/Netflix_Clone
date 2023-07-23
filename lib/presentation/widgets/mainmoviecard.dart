import 'package:flutter/material.dart';
class MainMovieCard extends StatelessWidget {
final String imageUrl;
  const MainMovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(7)
      ),
      
    );
  }
}
