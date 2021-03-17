import 'dart:convert';

import 'package:hypemovies/app/data/models/enum.dart';

class ModelSimilarMovies {
  ModelSimilarMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory ModelSimilarMovies.fromRawJson(String str) => ModelSimilarMovies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSimilarMovies.fromJson(Map<String, dynamic> json) => ModelSimilarMovies(
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
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.popularity,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  double popularity;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        releaseDate: json["release_date"] == null || json["release_date"] == "" ? null : DateTime.parse(json["release_date"]),
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "poster_path": posterPath == null ? null : posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
        "popularity": popularity == null ? null : popularity,
      };
}
