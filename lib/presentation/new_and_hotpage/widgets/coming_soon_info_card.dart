import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../../infrastructure/api_key.dart';
import '../../../model/movie_info.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/videowidget.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';

    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fetchDate(movieInfo.releaseDate!),
                  style: const TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                kHeight,
                const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.alarm_rounded,
                          title: 'Remind me',
                          iconSize: 17,
                          textSize: 12,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          icon: Icons.info_outline,
                          title: 'Info',
                          iconSize: 17,
                          textSize: 12,
                        ),
                        kWidth,
                      ],
                    )
                  ],
                ),
                kHeight,
                Text("Coming on ${fetchDay(movieInfo.releaseDate!)}"),
                kHeight,
                Text(
                  movieInfo.originalTitle ?? 'Empty Title',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                Text(
                  movieInfo.overview,
                  style: const TextStyle(color: kGreyColor),
                ),
                kHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }

  String fetchDate(String date) {
    //convert date in string format to date format
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    //add \n to make it in the displayable format eg:
    //APR
    //5
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
