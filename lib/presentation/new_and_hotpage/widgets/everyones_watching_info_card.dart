import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../../infrastructure/api_key.dart';
import '../../../model/movie_info.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/videowidget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
          VideoWidget(
            videoImage: imageUrl,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  icon: Icons.share,
                  title: 'Share',
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: "Play",
                  iconSize: 20,
                  textSize: 16,
                ),
                kWidth,
              ],
            ),
          ),
          kHeight,
          Text(
            movieInfo.originalTitle ?? 'No Title Found',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            movieInfo.overview,
            style: const TextStyle(color: kGreyColor),
          ),
        ],
      ),
    );
  }
}
