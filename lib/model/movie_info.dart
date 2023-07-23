//model class for data related to each of the movie details

class MovieInfoModel {
  bool? adult = false;
  String? backdropPath = "";
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String overview = "";
  String? posterPath;
  String? mediaType = "";
  List? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  num? voteAverage = 0.0;
  int? voteCount = 0;

  MovieInfoModel(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.genreIds,
      required this.originalLanguage,
      required this.mediaType,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  MovieInfoModel.fromJson(Map data) {
    adult = data['adult'];
    backdropPath = data['backdrop_path'];
    id = data['id'];
    title = data['title'];
    originalLanguage = data['original_language'];
    originalTitle = data['original_title'];
    overview = data['overview'];
    posterPath = data['poster_path'];
    mediaType = data['media_type'];
    genreIds = data['genre_ids'];
    popularity = data['popularity'];
    releaseDate = data['release_date'];
    video = data['video'];
    voteAverage = data['vote_average'];
    voteCount = data['vote_count'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['orginal_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'];

    return data;
  }
}
