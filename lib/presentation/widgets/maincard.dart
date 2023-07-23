import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constant.dart';

class MainCard extends StatelessWidget {
  final String imageUrlFromApi;

  const MainCard({
    super.key, required this.imageUrlFromApi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: NetworkImage(
            imageUrlFromApi),
            fit: BoxFit.cover
            ),
          borderRadius: kRadius10
            ),
    );
  }
}