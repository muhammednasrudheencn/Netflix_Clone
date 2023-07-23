import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/domain/apiendpoint.dart';

import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/search/widgets/titlewidget.dart';

import '../../../infrastructure/api_key.dart';
import '../../../model/movie_info.dart';
import '../../widgets/mainmoviecard.dart';

String imageUrl =
    "https://media.istockphoto.com/id/1051788618/vector/movie-and-film-poster-template-design-modern-retro-vintage-style.jpg?s=612x612&w=0&k=20&c=CwMag6f5GwoHexEtMA5zrep78r4Q4yV0ZF8X0CUCIUs=";

class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
  const SearchResultWidget({super.key, required this.apiQuery});

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apicall(ApiEndPoints.searchmovie + apiQuery),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                          Text('Please wait'),
                        ],
                      ),
                    );
                  }

                  if (snapshot.data == null) {
                    return const Center(
                        child: Text(
                      'No data found',
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  imageList =
                      snapshot.data.results.map((MovieInfoModel movieInfo) {
                    if (movieInfo.posterPath != null) {
                      imageUrl =
                          'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
                    }
                    return imageUrl;
                  }).toList();

                  if (imageList.isEmpty) {
                    return const Center(
                        child: Text(
                      'No Movies Found',
                      style: TextStyle(fontSize: 20),
                    ));
                  }

                  return GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 9,
                      childAspectRatio: 1 / 1.4,
                      shrinkWrap: true,
                      children: List.generate(imageList.length, (index) {
                        return MainMovieCard(
                          imageUrl: imageList[index],
                        );
                      }));
                }))
      ],
    );
  }
}
