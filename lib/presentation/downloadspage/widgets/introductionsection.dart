import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';

import 'package:netflix/model/movie_info.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../../infrastructure/api_key.dart';
import '../../../infrastructure/base_client.dart';
import 'downloadsimage.dart';

class IntroDownloads extends StatefulWidget {
  const IntroDownloads({
    super.key,
  });

  @override
  State<IntroDownloads> createState() => _IntroDownloadsState();
}

class _IntroDownloadsState extends State<IntroDownloads> {
  List imageList = [];

  @override
  void initState() {
    super.initState();
    initializeImages();
  }

  initializeImages() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);
    result == null ? debugPrint("null") : debugPrint("not null");
    setState(() {
      imageList = result.results.map((MovieInfoModel movieInfo) {
        if (movieInfo.posterPath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
        return imageUrl;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of \nmovies and shows for you, so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          width: size.width,
          height: size.width * 0.95,
          child: Stack(
            alignment: Alignment.center,
            children: imageList.length < 3
                ? []
                : [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: size.width * 0.38,
                    ),
                    DownloadsImageWidget(
                      image: imageList[0],
                      margin: const EdgeInsets.only(
                        left: 170,
                        top: 50,
                      ),
                      angle: 25,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidget(
                      image: imageList[1],
                      margin: const EdgeInsets.only(right: 170, top: 50),
                      angle: -25,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidget(
                      image: imageList[2],
                      radius: 8,
                      margin: const EdgeInsets.only(bottom: 35, top: 50),
                      size: Size(size.width * 0.37, size.width * 0.57),
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
