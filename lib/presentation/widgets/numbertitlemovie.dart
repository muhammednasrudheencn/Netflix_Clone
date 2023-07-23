import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';

import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

import '../../core/constants/constant.dart';
import '../../infrastructure/api_key.dart';
import '../../model/movie_info.dart';
import 'numbercard.dart';

class NumberTitleMovieCard extends StatelessWidget {
  const NumberTitleMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return FutureBuilder(
        future: apicall(ApiEndPoints.tvtoprate),
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
            return const Center(child: Text('No data found'));
          }

          imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
            if (movieInfo.posterPath == null) {
              return null;
            }
            String imageUrl =
                'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
            return imageUrl;
          }).toList();

          if (imageList.isEmpty) {
            return const Center(
                child: ListTile(title: Text('No Movies Found')));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TitleTextWidget(
                  title: 'Top Rated TV Shows',
                ),
              ),
              kHeight,
              LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => NumberCard(
                      index: index,
                      imageUrl: imageList[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
