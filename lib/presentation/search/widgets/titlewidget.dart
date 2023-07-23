import 'package:flutter/material.dart';

class SearchPageTitleWIdget extends StatelessWidget {
  final String title;
  const SearchPageTitleWIdget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
