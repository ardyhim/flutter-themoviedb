import 'package:hive/hive.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/genres.dart';

part 'bookmarks.g.dart';

@HiveType(typeId: 1)
class StoreBookmark extends HiveObject {
  StoreBookmark({
    this.name,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.id,
    this.mediaType,
    this.genres,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String overview;

  @HiveField(2)
  double voteAverage;

  @HiveField(3)
  String posterPath;

  @HiveField(4)
  int id;

  @HiveField(5)
  MediaType mediaType;

  @HiveField(6)
  List<Genre> genres;
}
