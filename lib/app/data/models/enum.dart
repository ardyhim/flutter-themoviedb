import 'package:hive/hive.dart';
part 'enum.g.dart';

enum TimeWindow { WEEK, DAY }

final timeWindowValues = EnumValues({"week": TimeWindow.WEEK, "day": TimeWindow.DAY});

@HiveType(typeId: 2)
enum MediaType {
  @HiveField(0)
  MOVIE,
  @HiveField(1)
  TV,
  @HiveField(2)
  ALL,
  @HiveField(3)
  PERSON,
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV,
  "all": MediaType.ALL,
  "person": MediaType.PERSON,
});

enum ListType {
  FAVORITE,
  WATCHLIST,
  DISCOVER,
}

final listTypeValues = EnumValues({});

enum SortBy {
  POPULARITY_DECS,
  POPULARITY_ASC,
  RELEASE_DATE_DESC,
  RELEASE_DATE_ASC,
  REVENUE_DESC,
  REVENUE_ASC,
  PRIMARY_RELEASE_DATE_DESC,
  PRIMARY_RELEASE_DATE_ASC,
  ORIGINAL_TITLE_DESC,
  ORIGINAL_TITLE_ASC,
  VOTE_AVERAGE_DESC,
  VOTE_AVERAGE_ASC,
  VOTE_COUNT_DESC,
  VOTE_COUNT_ASC,
  CREATED_AT_DESC,
  CREATED_AT_ASC,
}
final sortByValues = EnumValues({
  "popularity.desc": SortBy.POPULARITY_DECS,
  "popularity.asc": SortBy.POPULARITY_ASC,
  "release_date.desc": SortBy.RELEASE_DATE_DESC,
  "release_date.asc": SortBy.RELEASE_DATE_ASC,
  "revenue.desc": SortBy.REVENUE_DESC,
  "revenue.asc": SortBy.REVENUE_ASC,
  "primary_release_date.desc": SortBy.PRIMARY_RELEASE_DATE_DESC,
  "primary_release_date.asc": SortBy.PRIMARY_RELEASE_DATE_ASC,
  "original_title.desc": SortBy.ORIGINAL_TITLE_DESC,
  "original_title.asc": SortBy.ORIGINAL_TITLE_ASC,
  "vote_average.desc": SortBy.VOTE_AVERAGE_DESC,
  "vote_average.asc": SortBy.VOTE_AVERAGE_ASC,
  "vote_count.desc": SortBy.VOTE_COUNT_DESC,
  "vote_count.asc": SortBy.VOTE_COUNT_ASC,
  "created_at.desc": SortBy.CREATED_AT_DESC,
  "created_at.asc": SortBy.CREATED_AT_ASC,
});

enum OriginCountry { US, ES, CA, MX }

final originCountryValues = EnumValues({"CA": OriginCountry.CA, "ES": OriginCountry.ES, "MX": OriginCountry.MX, "US": OriginCountry.US});
enum OriginalLanguage { EN, IT }

final originalLanguageValues = EnumValues({"en": OriginalLanguage.EN, "it": OriginalLanguage.IT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
