import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';

import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/widgets/playbutton.dart';

import '../../core/constants/constant.dart';
import '../../infrastructure/api_key.dart';
import '../../model/movie_info.dart';
import 'custombutton.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  initState() {
    super.initState();
    setImage();
  }

  setImage() async {
    dynamic result = await apicall(ApiEndPoints.moviepopular);

    setState(() {
      if (result.results.isNotEmpty) {
        MovieInfoModel movieInfo = result.results[0];
        imageUrl =
            "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey";
      }
    });
  }

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl ?? kMainImage),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.85),
            Colors.black.withOpacity(0),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                PlayButton(),
                CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}
