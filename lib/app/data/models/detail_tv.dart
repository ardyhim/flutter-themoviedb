import 'dart:convert';

class ModelTv {
  ModelTv({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  String backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  DateTime firstAirDate;
  List<Genre> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  DateTime lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<Network> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<Network> productionCompanies;
  List<ProductionCountry> productionCountries;
  List<Season> seasons;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  factory ModelTv.fromRawJson(String str) => ModelTv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTv.fromJson(Map<String, dynamic> json) => ModelTv(
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        createdBy: json["created_by"] == null ? null : List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
        episodeRunTime: json["episode_run_time"] == null ? null : List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        genres: json["genres"] == null ? null : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        inProduction: json["in_production"] == null ? null : json["in_production"],
        languages: json["languages"] == null ? null : List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: json["last_air_date"] == null ? null : DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: json["last_episode_to_air"] == null ? null : LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"] == null ? null : json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"] == null ? null : List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"] == null ? null : json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"] == null ? null : json["number_of_seasons"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        originalName: json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        productionCompanies: json["production_companies"] == null ? null : List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
        productionCountries:
            json["production_countries"] == null ? null : List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        seasons: json["seasons"] == null ? null : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        spokenLanguages: json["spoken_languages"] == null ? null : List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        type: json["type"] == null ? null : json["type"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "created_by": createdBy == null ? null : List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": episodeRunTime == null ? null : List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "in_production": inProduction == null ? null : inProduction,
        "languages": languages == null ? null : List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": lastAirDate == null
            ? null
            : "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir == null ? null : lastEpisodeToAir.toJson(),
        "name": name == null ? null : name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": networks == null ? null : List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes == null ? null : numberOfEpisodes,
        "number_of_seasons": numberOfSeasons == null ? null : numberOfSeasons,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "production_companies": productionCompanies == null ? null : List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": productionCountries == null ? null : List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "seasons": seasons == null ? null : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages": spokenLanguages == null ? null : List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "tagline": tagline == null ? null : tagline,
        "type": type == null ? null : type,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  int id;
  String creditId;
  String name;
  int gender;
  String profilePath;

  factory CreatedBy.fromRawJson(String str) => CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"] == null ? null : json["id"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        name: json["name"] == null ? null : json["name"],
        gender: json["gender"] == null ? null : json["gender"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "credit_id": creditId == null ? null : creditId,
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "profile_path": profilePath == null ? null : profilePath,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class LastEpisodeToAir {
  LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  DateTime airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  String stillPath;
  double voteAverage;
  int voteCount;

  factory LastEpisodeToAir.fromRawJson(String str) => LastEpisodeToAir.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => LastEpisodeToAir(
        airDate: json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeNumber: json["episode_number"] == null ? null : json["episode_number"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        productionCode: json["production_code"] == null ? null : json["production_code"],
        seasonNumber: json["season_number"] == null ? null : json["season_number"],
        stillPath: json["still_path"] == null ? null : json["still_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber == null ? null : episodeNumber,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "production_code": productionCode == null ? null : productionCode,
        "season_number": seasonNumber == null ? null : seasonNumber,
        "still_path": stillPath == null ? null : stillPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

class Network {
  Network({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });

  String name;
  int id;
  String logoPath;
  String originCountry;

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        originCountry: json["origin_country"] == null ? null : json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "logo_path": logoPath == null ? null : logoPath,
        "origin_country": originCountry == null ? null : originCountry,
      };
}

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  String iso31661;
  String name;

  factory ProductionCountry.fromRawJson(String str) => ProductionCountry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "name": name == null ? null : name,
      };
}

class Season {
  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  DateTime airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;

  factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        airDate: json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeCount: json["episode_count"] == null ? null : json["episode_count"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        seasonNumber: json["season_number"] == null ? null : json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episode_count": episodeCount == null ? null : episodeCount,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "poster_path": posterPath == null ? null : posterPath,
        "season_number": seasonNumber == null ? null : seasonNumber,
      };
}

class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String englishName;
  String iso6391;
  String name;

  factory SpokenLanguage.fromRawJson(String str) => SpokenLanguage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"] == null ? null : json["english_name"],
        iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName == null ? null : englishName,
        "iso_639_1": iso6391 == null ? null : iso6391,
        "name": name == null ? null : name,
      };
}
