import 'dart:convert';

class MoviesDetail {
  MoviesDetail({
    this.videosId,
    this.title,
    this.description,
    this.slug,
    this.release,
    this.runtime,
    this.videoQuality,
    this.isTvseries,
    this.isPaid,
    this.enableDownload,
    this.downloadLinks,
    this.thumbnailUrl,
    this.posterUrl,
    this.videos,
    this.genre,
    this.country,
    this.director,
    this.writer,
    this.cast,
    this.castAndCrew,
    this.relatedMovie,
  });

  String videosId;
  String title;
  String description;
  String slug;
  DateTime release;
  String runtime;
  String videoQuality;
  String isTvseries;
  String isPaid;
  String enableDownload;
  List<dynamic> downloadLinks;
  String thumbnailUrl;
  String posterUrl;
  List<dynamic> videos;
  List<MoviesGenre> genre;
  List<MoviesCountry> country;
  List<MoviesCast> director;
  List<MoviesCast> writer;
  List<MoviesCast> cast;
  List<MoviesCast> castAndCrew;
  List<RelatedMovie> relatedMovie;

  factory MoviesDetail.fromRawJson(String str) => MoviesDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesDetail.fromJson(Map<String, dynamic> json) => MoviesDetail(
        videosId: json["videos_id"] == null ? null : json["videos_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        slug: json["slug"] == null ? null : json["slug"],
        release: json["release"] == null ? null : DateTime.parse(json["release"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        videoQuality: json["video_quality"] == null ? null : json["video_quality"],
        isTvseries: json["is_tvseries"] == null ? null : json["is_tvseries"],
        isPaid: json["is_paid"] == null ? null : json["is_paid"],
        enableDownload: json["enable_download"] == null ? null : json["enable_download"],
        downloadLinks: json["download_links"] == null ? null : List<dynamic>.from(json["download_links"].map((x) => x)),
        thumbnailUrl: json["thumbnail_url"] == null ? null : json["thumbnail_url"],
        posterUrl: json["poster_url"] == null ? null : json["poster_url"],
        videos: json["videos"] == null ? null : List<dynamic>.from(json["videos"].map((x) => x)),
        genre: json["genre"] == null ? null : List<MoviesGenre>.from(json["genre"].map((x) => MoviesGenre.fromJson(x))),
        country: json["country"] == null ? null : List<MoviesCountry>.from(json["country"].map((x) => MoviesCountry.fromJson(x))),
        director: json["director"] == null ? null : List<MoviesCast>.from(json["director"].map((x) => MoviesCast.fromJson(x))),
        writer: json["writer"] == null ? null : List<MoviesCast>.from(json["writer"].map((x) => MoviesCast.fromJson(x))),
        cast: json["cast"] == null ? null : List<MoviesCast>.from(json["cast"].map((x) => MoviesCast.fromJson(x))),
        castAndCrew: json["cast_and_crew"] == null ? null : List<MoviesCast>.from(json["cast_and_crew"].map((x) => MoviesCast.fromJson(x))),
        relatedMovie: json["related_movie"] == null ? null : List<RelatedMovie>.from(json["related_movie"].map((x) => RelatedMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "videos_id": videosId == null ? null : videosId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "slug": slug == null ? null : slug,
        "release": release == null
            ? null
            : "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "runtime": runtime == null ? null : runtime,
        "video_quality": videoQuality == null ? null : videoQuality,
        "is_tvseries": isTvseries == null ? null : isTvseries,
        "is_paid": isPaid == null ? null : isPaid,
        "enable_download": enableDownload == null ? null : enableDownload,
        "download_links": downloadLinks == null ? null : List<dynamic>.from(downloadLinks.map((x) => x)),
        "thumbnail_url": thumbnailUrl == null ? null : thumbnailUrl,
        "poster_url": posterUrl == null ? null : posterUrl,
        "videos": videos == null ? null : List<dynamic>.from(videos.map((x) => x)),
        "genre": genre == null ? null : List<dynamic>.from(genre.map((x) => x.toJson())),
        "country": country == null ? null : List<dynamic>.from(country.map((x) => x.toJson())),
        "director": director == null ? null : List<dynamic>.from(director.map((x) => x.toJson())),
        "writer": writer == null ? null : List<dynamic>.from(writer.map((x) => x.toJson())),
        "cast": cast == null ? null : List<dynamic>.from(cast.map((x) => x.toJson())),
        "cast_and_crew": castAndCrew == null ? null : List<dynamic>.from(castAndCrew.map((x) => x.toJson())),
        "related_movie": relatedMovie == null ? null : List<dynamic>.from(relatedMovie.map((x) => x.toJson())),
      };
}

class MoviesCast {
  MoviesCast({
    this.starId,
    this.name,
    this.url,
    this.imageUrl,
  });

  String starId;
  String name;
  String url;
  String imageUrl;

  factory MoviesCast.fromRawJson(String str) => MoviesCast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesCast.fromJson(Map<String, dynamic> json) => MoviesCast(
        starId: json["star_id"] == null ? null : json["star_id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "star_id": starId == null ? null : starId,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "image_url": imageUrl == null ? null : imageUrl,
      };
}

class MoviesCountry {
  MoviesCountry({
    this.countryId,
    this.name,
    this.url,
  });

  String countryId;
  String name;
  String url;

  factory MoviesCountry.fromRawJson(String str) => MoviesCountry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesCountry.fromJson(Map<String, dynamic> json) => MoviesCountry(
        countryId: json["country_id"] == null ? null : json["country_id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId == null ? null : countryId,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class MoviesGenre {
  MoviesGenre({
    this.genreId,
    this.name,
    this.url,
  });

  String genreId;
  String name;
  String url;

  factory MoviesGenre.fromRawJson(String str) => MoviesGenre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesGenre.fromJson(Map<String, dynamic> json) => MoviesGenre(
        genreId: json["genre_id"] == null ? null : json["genre_id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "genre_id": genreId == null ? null : genreId,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class RelatedMovie {
  RelatedMovie({
    this.videosId,
    this.genre,
    this.country,
    this.title,
    this.description,
    this.slug,
    this.release,
    this.runtime,
    this.videoQuality,
    this.thumbnailUrl,
    this.posterUrl,
  });

  String videosId;
  String genre;
  String country;
  String title;
  String description;
  String slug;
  String release;
  String runtime;
  String videoQuality;
  String thumbnailUrl;
  String posterUrl;

  factory RelatedMovie.fromRawJson(String str) => RelatedMovie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedMovie.fromJson(Map<String, dynamic> json) => RelatedMovie(
        videosId: json["videos_id"] == null ? null : json["videos_id"],
        genre: json["genre"] == null ? null : json["genre"],
        country: json["country"] == null ? null : json["country"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        slug: json["slug"] == null ? null : json["slug"],
        release: json["release"] == null ? null : json["release"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        videoQuality: json["video_quality"] == null ? null : json["video_quality"],
        thumbnailUrl: json["thumbnail_url"] == null ? null : json["thumbnail_url"],
        posterUrl: json["poster_url"] == null ? null : json["poster_url"],
      );

  Map<String, dynamic> toJson() => {
        "videos_id": videosId == null ? null : videosId,
        "genre": genre == null ? null : genre,
        "country": country == null ? null : country,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "slug": slug == null ? null : slug,
        "release": release == null ? null : release,
        "runtime": runtime == null ? null : runtime,
        "video_quality": videoQuality == null ? null : videoQuality,
        "thumbnail_url": thumbnailUrl == null ? null : thumbnailUrl,
        "poster_url": posterUrl == null ? null : posterUrl,
      };
}
