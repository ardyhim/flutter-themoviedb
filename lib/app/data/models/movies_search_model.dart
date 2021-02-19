import 'dart:convert';

import 'package:hypemovies/app/data/models/movies_list_model.dart';

class MoviesSearch {
  MoviesSearch({
    this.movie,
    this.tvseries,
    this.tvChannels,
  });

  List<MoviesList> movie;
  List<dynamic> tvseries;
  List<dynamic> tvChannels;

  factory MoviesSearch.fromRawJson(String str) => MoviesSearch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesSearch.fromJson(Map<String, dynamic> json) => MoviesSearch(
        movie: json["movie"] == null ? null : List<MoviesList>.from(json["movie"].map((x) => MoviesList.fromJson(x))),
        tvseries: json["tvseries"] == null ? null : List<dynamic>.from(json["tvseries"].map((x) => x)),
        tvChannels: json["tv_channels"] == null ? null : List<dynamic>.from(json["tv_channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "movie": movie == null ? null : List<dynamic>.from(movie.map((x) => x.toJson())),
        "tvseries": tvseries == null ? null : List<dynamic>.from(tvseries.map((x) => x)),
        "tv_channels": tvChannels == null ? null : List<dynamic>.from(tvChannels.map((x) => x)),
      };
}
