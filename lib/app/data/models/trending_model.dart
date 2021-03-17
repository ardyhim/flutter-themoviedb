import 'dart:convert';

import 'package:hypemovies/app/data/models/enum.dart';

class ModelTrending {
  ModelTrending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory ModelTrending.fromRawJson(String str) => ModelTrending.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTrending.fromJson(Map<String, dynamic> json) => ModelTrending(
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
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.releaseDate,
    this.id,
    this.video,
    this.adult,
    this.popularity,
    this.mediaType,
    this.firstAirDate,
    this.originalName,
    this.originCountry,
    this.name,
  });

  String backdropPath;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  double voteAverage;
  int voteCount;
  String overview;
  DateTime releaseDate;
  int id;
  bool video;
  bool adult;
  double popularity;
  MediaType mediaType;
  DateTime firstAirDate;
  String originalName;
  List<String> originCountry;
  String name;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        title: json["title"] == null ? null : json["title"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        overview: json["overview"] == null ? null : json["overview"],
        releaseDate: json["release_date"] == null || json["release_date"] == "" ? null : DateTime.parse(json["release_date"]),
        id: json["id"] == null ? null : json["id"],
        video: json["video"] == null ? null : json["video"],
        adult: json["adult"] == null ? null : json["adult"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
        firstAirDate: json["first_air_date"] == null || json["first_air_date"] == "" ? null : DateTime.parse(json["first_air_date"]),
        originalName: json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "poster_path": posterPath == null ? null : posterPath,
        "title": title == null ? null : title,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
        "overview": overview == null ? null : overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "id": id == null ? null : id,
        "video": video == null ? null : video,
        "adult": adult == null ? null : adult,
        "popularity": popularity == null ? null : popularity,
        "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
        "name": name == null ? null : name,
      };
}
