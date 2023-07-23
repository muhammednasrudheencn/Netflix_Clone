import 'movie_info.dart';

//tmdb returns a json file with main fields => current page,list of movie results,totalpages of results,total resultscount
//following model is to store above related data.

//results will be all movie details with respective details of  movie like id,name,descroption,images etc. so we store it in movieinfomodel class
class TMDBApiResponseModel {
  int page = 0;
  List<MovieInfoModel> results = [];
  int totalPages = 0;
  int totalResults = 0;

  TMDBApiResponseModel.fromJson(Map data) {
    page = data['page'];
    results = List<MovieInfoModel>.from(data['results'].map((item) {
      MovieInfoModel movieInfo = MovieInfoModel.fromJson(item);
      return movieInfo;
    }));
    totalPages = data['total_pages'];
    totalResults = data['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['page'] = page;
    data['results'] =
        results.map((MovieInfoModel movieInfo) => movieInfo.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;

    return data;
  }
}
