import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/presentation/widgets/customappbar.dart';
import '../../core/constants/constant.dart';
import '../widgets/backgroundcard.dart';
import '../widgets/maintitlecard.dart';
import '../widgets/numbertitlemovie.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: ((notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          BackgroundCard(),
                          kHeight,
                          MainTitleMovieCard(
                            title: "New Releases",
                            apiUrl: ApiEndPoints.moviepopular,
                          ),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Trending Now",
                            apiUrl: ApiEndPoints.trendingall,
                          ),
                          kHeight,
                          NumberTitleMovieCard(),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Popular Shows",
                            apiUrl: ApiEndPoints.tvpopular,
                          ),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Upcoming",
                            apiUrl: ApiEndPoints.upcoming,
                          ),
                          kHeight,
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  CustomAppBar(
                                    leftwidget: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/640px-Netflix_2015_N_logo.svg.png',
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("TV Shows", style: kHomeTitleText),
                                      Text(
                                        "Movies",
                                        style: kHomeTitleText,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Categories",
                                            style: kHomeTitleText,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kHeight,
                    ],
                  ),
                ),
              );
            }));
  }
}
