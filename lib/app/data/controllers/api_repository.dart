import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/discover_movies.dart';
import 'package:hypemovies/app/data/models/discover_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/search_model.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';
import 'package:hypemovies/app/data/models/trending_model.dart';
import 'package:hypemovies/app/data/models/videos.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';

class ApiRepository {
  ApiRepository({this.provider});
  final ApiProvider provider;

  Future<ModelDiscoverMovies> getDiscoverMovie({
    int page = 1,
    SortBy sortBy = SortBy.POPULARITY_DECS,
  }) async {
    final res = await provider.getDiscoverMovie(page: page, sortBy: sortBy);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelDiscoverMovies movies;
      movies = new ModelDiscoverMovies.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelDiscoverTv> getDiscoverTv({
    int page = 1,
    SortBy sortBy = SortBy.POPULARITY_DECS,
  }) async {
    final res = await provider.getDiscoverTv(page: page, sortBy: sortBy);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelDiscoverTv tv;
      tv = new ModelDiscoverTv.fromJson(res.body);
      return tv;
    }
  }

  Future<ModelSearch> getSearch({int page = 1, String query}) async {
    final res = await provider.getSearch(page: page, query: query);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelSearch search;
      search = new ModelSearch.fromJson(res.body);
      return search;
    }
  }

  Future<ModelTrending> getTrending({
    MediaType mediaType = MediaType.MOVIE,
    TimeWindow timeWindow = TimeWindow.DAY,
  }) async {
    final res = await provider.getTrending(mediaType: mediaType, timeWindow: timeWindow);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelTrending movies;
      movies = new ModelTrending.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelMovies> getDetailMovies({String id}) async {
    final res = await provider.getDetailMovies(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelMovies movies;
      movies = new ModelMovies.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelSimilarMovies> getSimilarMovies({String id}) async {
    final res = await provider.getSimilarMovies(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelSimilarMovies movies;
      movies = new ModelSimilarMovies.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelVideos> getVideosMovies({String id}) async {
    final res = await provider.getVideosMovies(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelVideos videos;
      videos = new ModelVideos.fromJson(res.body);
      return videos;
    }
  }

  Future<ModelTv> getDetailTv({String id}) async {
    final res = await provider.getDetailTv(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelTv tv;
      tv = new ModelTv.fromJson(res.body);
      return tv;
    }
  }

  Future<ModelSimilarTv> getSimilarTv({String id}) async {
    final res = await provider.getSimilarTv(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelSimilarTv tv;
      tv = new ModelSimilarTv.fromJson(res.body);
      return tv;
    }
  }

  Future<ModelVideos> getVideosTv({String id}) async {
    final res = await provider.getVideosTv(id: id);
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelVideos videos;
      videos = new ModelVideos.fromJson(res.body);
      return videos;
    }
  }
}
