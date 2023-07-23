import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';

import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/model/movie_info.dart';
import 'package:netflix/presentation/search/widgets/titlewidget.dart';
import '../../../core/constants/constant.dart';
import '../../../infrastructure/api_key.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apicall(ApiEndPoints.trendingall),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    const Center(
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
                    return const Text("No data found");
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) => TopSearchItemTile(
                            movieInfo: snapshot.data.results[index],
                          ),
                      separatorBuilder: (context, index) => kHeight20,
                      itemCount: 10);
                }))
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItemTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(2)),
        ),
        kWidth,
        Expanded(
            child: Text(
          movieInfo.title ?? "No Movie Name Found",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,
        )
      ],
    );
  }
}
