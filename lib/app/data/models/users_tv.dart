// To parse this JSON data, do
//
//     final ModelUsersTv = ModelUsersTvFromJson(jsonString);

import 'dart:convert';

class ModelUsersTv {
  ModelUsersTv({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory ModelUsersTv.fromRawJson(String str) => ModelUsersTv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelUsersTv.fromJson(Map<String, dynamic> json) => ModelUsersTv(
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
    this.voteAverage,
    this.originalName,
    this.originCountry,
    this.name,
    this.backdropPath,
    this.voteCount,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.overview,
    this.posterPath,
    this.originalLanguage,
    this.popularity,
  });

  double voteAverage;
  String originalName;
  List<String> originCountry;
  String name;
  String backdropPath;
  int voteCount;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String overview;
  String posterPath;
  String originalLanguage;
  double popularity;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        originalName: json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        firstAirDate: json["first_air_date"] == null || json["first_air_date"] == "" ? null : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        overview: json["overview"] == null ? null : json["overview"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "vote_average": voteAverage == null ? null : voteAverage,
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
        "name": name == null ? null : name,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "vote_count": voteCount == null ? null : voteCount,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "overview": overview == null ? null : overview,
        "poster_path": posterPath == null ? null : posterPath,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "popularity": popularity == null ? null : popularity,
      };
}
