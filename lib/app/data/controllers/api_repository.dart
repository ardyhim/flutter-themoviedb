import 'dart:convert';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/movies_detail_model.dart';
import 'package:hypemovies/app/data/models/movies_list_model.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';
import 'package:meta/meta.dart';

class ApiRepository {
  ApiRepository({this.provider});
  final ApiProvider provider;

  Future<List<MoviesList>> getLatestMovies() async {
    final res = await provider.getLatestMovies();
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      List<MoviesList> movies = [];
      List data = jsonDecode(res.body);

      data.forEach((element) {
        movies.add(MoviesList.fromJson(element));
      });
      return movies;
    }
  }

  Future<MoviesDetail> getDetails({
    String type = "movie",
    id,
  }) async {
    final res = await provider.getDetails(type: type, id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      // var data = jsonDecode(res.body);
      MoviesDetail movies = new MoviesDetail.fromRawJson(res.body);
      return movies;
    }
  }
// getId(id){
//   return apiClient.getId(id);
// }
// delete(id){
//   return apiClient.delete(id);
// }
// edit(obj){
//   return apiClient.edit( obj );
// }
// add(obj){
//     return apiClient.add( obj );
// }

}
