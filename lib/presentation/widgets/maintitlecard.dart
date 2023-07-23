import 'package:flutter/material.dart';

import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

import '../../core/constants/constant.dart';
import '../../infrastructure/api_key.dart';
import '../../model/movie_info.dart';
import 'maincard.dart';

class MainTitleMovieCard extends StatelessWidget {
  final String title;
  final String apiUrl;
  const MainTitleMovieCard(
      {super.key, required this.title, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return FutureBuilder(
        future: apicall(apiUrl),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Center(
              child: Column(children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ]),
            );
          }
          if (snapshot.data == null) {
            return const Text('No data found');
          }
          if (snapshot.hasData) {
            imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
              if (movieInfo.posterPath == null) {
                return null;
              }

              String imageUrl =
                  'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
              return imageUrl;
            }).toList();
            if (imageList.isEmpty) {
              return ListTile(title: Text('No $title'));
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextWidget(title: title),
              kHeight,
              SizedBox(
                height: 225,
                child: ListView.separated(
                  //padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      MainCard(imageUrlFromApi: imageList[index]),
                  itemCount: 10,
                  separatorBuilder: (context, index) => kWidth,
                ),
              )
            ],
          );
        });
  }
}
