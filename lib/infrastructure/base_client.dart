import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/tmdb_api_response.dart';


Future<dynamic> apicall(String url) async {
  http.Response response;
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
    TMDBApiResponseModel tmdbApiResponse = TMDBApiResponseModel.fromJson(data);
    return tmdbApiResponse;
  }
  return;
}
