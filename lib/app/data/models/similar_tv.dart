// To parse this JSON data, do
//
//     final modelTvSimilar = modelTvSimilarFromJson(jsonString);

import 'dart:convert';

import 'package:hypemovies/app/data/models/enum.dart';

class ModelSimilarTv {
  ModelSimilarTv({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory ModelSimilarTv.fromRawJson(String str) => ModelSimilarTv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSimilarTv.fromJson(Map<String, dynamic> json) => ModelSimilarTv(
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
    this.genreIds,
    this.originalName,
    this.originCountry,
    this.posterPath,
    this.voteAverage,
    this.overview,
    this.voteCount,
    this.name,
    this.id,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.popularity,
  });

  List<int> genreIds;
  String originalName;
  List<OriginCountry> originCountry;
  String posterPath;
  double voteAverage;
  String overview;
  int voteCount;
  String name;
  int id;
  DateTime firstAirDate;
  String backdropPath;
  OriginalLanguage originalLanguage;
  double popularity;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        originalName: json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null ? null : List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x])),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        overview: json["overview"] == null ? null : json["overview"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        firstAirDate: json["first_air_date"] == null || json["first_air_date"] == "" ? null : DateTime.parse(json["first_air_date"]),
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => originCountryValues.reverse[x])),
        "poster_path": posterPath == null ? null : posterPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "overview": overview == null ? null : overview,
        "vote_count": voteCount == null ? null : voteCount,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "popularity": popularity == null ? null : popularity,
      };
}
