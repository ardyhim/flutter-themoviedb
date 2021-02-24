enum TimeWindow { WEEK, DAY }

final timeWindowValues = EnumValues({"week": TimeWindow.WEEK, "day": TimeWindow.DAY});

enum MediaType { MOVIE, TV, ALL, PERSON }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV,
  "all": MediaType.ALL,
  "person": MediaType.PERSON,
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
