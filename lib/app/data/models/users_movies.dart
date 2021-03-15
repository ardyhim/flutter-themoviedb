// To parse this JSON data, do
//
//     final ModelUsersMovies = ModelUsersMoviesFromJson(jsonString);

import 'dart:convert';

import 'package:hypemovies/app/data/models/enum.dart';

class ModelUsersMovies {
  ModelUsersMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory ModelUsersMovies.fromRawJson(String str) => ModelUsersMovies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelUsersMovies.fromJson(Map<String, dynamic> json) => ModelUsersMovies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class Result {
  Result({
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.title,
    this.video,
    this.voteAverage,
    this.id,
    this.overview,
    this.popularity,
  });

  DateTime releaseDate;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int voteCount;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  bool video;
  double voteAverage;
  int id;
  String overview;
  double popularity;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        id: json["id"] == null ? null : json["id"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "vote_count": voteCount == null ? null : voteCount,
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "poster_path": posterPath == null ? null : posterPath,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "id": id == null ? null : id,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
      };
}
