import 'dart:convert';

import 'package:hypemovies/app/data/models/enum.dart';

class ModelSearch {
  ModelSearch({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  int page;
  List<ModelSearchResult> results;
  int totalResults;
  int totalPages;

  factory ModelSearch.fromRawJson(String str) => ModelSearch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSearch.fromJson(Map<String, dynamic> json) => ModelSearch(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<ModelSearchResult>.from(json["results"].map((x) => ModelSearchResult.fromJson(x))),
        totalResults: json["total_results"] == null ? null : json["total_results"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "total_results": totalResults == null ? null : totalResults,
        "total_pages": totalPages == null ? null : totalPages,
      };
}

class ModelSearchResult {
  ModelSearchResult({
    this.posterPath,
    this.popularity,
    this.id,
    this.overview,
    this.backdropPath,
    this.voteAverage,
    this.mediaType,
    this.firstAirDate,
    this.originCountry,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    this.name,
    this.originalName,
    this.adult,
    this.releaseDate,
    this.originalTitle,
    this.title,
    this.video,
    this.profilePath,
    this.knownFor,
  });

  String posterPath;
  double popularity;
  int id;
  String overview;
  String backdropPath;
  double voteAverage;
  MediaType mediaType;
  String firstAirDate;
  List<String> originCountry;
  List<int> genreIds;
  OriginalLanguage originalLanguage;
  int voteCount;
  String name;
  String originalName;
  bool adult;
  DateTime releaseDate;
  String originalTitle;
  String title;
  bool video;
  String profilePath;
  List<ModelSearchKnownFor> knownFor;

  factory ModelSearchResult.fromRawJson(String str) => ModelSearchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSearchResult.fromJson(Map<String, dynamic> json) => ModelSearchResult(
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        id: json["id"] == null ? null : json["id"],
        overview: json["overview"] == null ? null : json["overview"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
        firstAirDate: json["first_air_date"] == null ? null : json["first_air_date"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        name: json["name"] == null ? null : json["name"],
        originalName: json["original_name"] == null ? null : json["original_name"],
        adult: json["adult"] == null ? null : json["adult"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        knownFor: json["known_for"] == null ? null : List<ModelSearchKnownFor>.from(json["known_for"].map((x) => ModelSearchResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath == null ? null : posterPath,
        "popularity": popularity == null ? null : popularity,
        "id": id == null ? null : id,
        "overview": overview == null ? null : overview,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
        "first_air_date": firstAirDate == null ? null : firstAirDate,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "vote_count": voteCount == null ? null : voteCount,
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "adult": adult == null ? null : adult,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "original_title": originalTitle == null ? null : originalTitle,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "profile_path": profilePath == null ? null : profilePath,
        "known_for": knownFor == null ? null : List<dynamic>.from(knownFor.map((x) => x.toJson())),
      };
}

class ModelSearchKnownFor {
  ModelSearchKnownFor({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.originalTitle,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  String posterPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  String originalTitle;
  List<int> genreIds;
  int id;
  String mediaType;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  factory ModelSearchKnownFor.fromRawJson(String str) => ModelSearchKnownFor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSearchKnownFor.fromJson(Map<String, dynamic> json) => ModelSearchKnownFor(
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        adult: json["adult"] == null ? null : json["adult"],
        overview: json["overview"] == null ? null : json["overview"],
        releaseDate: json["release_date"] == null || json["release_date"] == "" ? null : DateTime.parse(json["release_date"]),
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        title: json["title"] == null ? null : json["title"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath == null ? null : posterPath,
        "adult": adult == null ? null : adult,
        "overview": overview == null ? null : overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "original_title": originalTitle == null ? null : originalTitle,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "media_type": mediaType == null ? null : mediaType,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "title": title == null ? null : title,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "popularity": popularity == null ? null : popularity,
        "vote_count": voteCount == null ? null : voteCount,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
      };
}
