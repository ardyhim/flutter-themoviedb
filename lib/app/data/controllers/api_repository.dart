import 'package:hypemovies/app/data/models/account.dart';
import 'package:hypemovies/app/data/models/account_state.dart';
import 'package:hypemovies/app/data/models/create_session.dart';
import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/discover_movies.dart';
import 'package:hypemovies/app/data/models/discover_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/guest_session.dart';
import 'package:hypemovies/app/data/models/users_movies.dart';
import 'package:hypemovies/app/data/models/users_tv.dart';
import 'package:hypemovies/app/data/models/message.dart';
import 'package:hypemovies/app/data/models/search_model.dart';
import 'package:hypemovies/app/data/models/session_with_login.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';
import 'package:hypemovies/app/data/models/trending_model.dart';
import 'package:hypemovies/app/data/models/videos.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';

class ApiRepository {
  final ApiProvider provider;
  ApiRepository({this.provider});

  Future<ModelSessionWithLogin> createRequestToken() async {
    final res = await provider.createRequestToken();
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelSessionWithLogin data;
      data = new ModelSessionWithLogin.fromJson(res.body);
      return data;
    }
  }

  Future<ModelSessionWithLogin> createSessionWithLogin({
    String username,
    String password,
    String token,
  }) async {
    final res = await provider.createSessionWithLogin(
      token: token,
      username: username,
      password: password,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelSessionWithLogin data;
      data = new ModelSessionWithLogin.fromJson(res.body);
      return data;
    }
  }

  Future<ModelCreateSession> createSession({String token}) async {
    final res = await provider.createSession(
      token: token,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelCreateSession data;
      data = new ModelCreateSession.fromJson(res.body);
      return data;
    }
  }

  Future<ModelGuestSession> createGuestSession({String token}) async {
    final res = await provider.createGuestSession(
      token: token,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelGuestSession data;
      data = new ModelGuestSession.fromJson(res.body);
      return data;
    }
  }

  Future<ModelMessage> deleteSession({String sessionId}) async {
    final res = await provider.deleteSession(
      sessionId: sessionId,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelMessage data;
      data = new ModelMessage.fromJson(res.body);
      return data;
    }
  }

  Future<ModelAccount> getAccount({String sessionId}) async {
    final res = await provider.getAccount(
      sessionId: sessionId,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelAccount data;
      data = new ModelAccount.fromJson(res.body);
      return data;
    }
  }

  Future<ModelAccountState> getAccountStates({
    String id,
    MediaType mediaType,
    String sessionId,
  }) async {
    final res = await provider.getAccountStates(
      sessionId: sessionId,
      id: id,
      mediaType: mediaType,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelAccountState accountState;
      accountState = new ModelAccountState.fromJson(res.body);
      return accountState;
    }
  }

  Future<ModelMessage> markAsFavorite({
    MediaType mediaType,
    String id,
    bool favorite = true,
    int accountId,
    String sessionId,
  }) async {
    final res = await provider.markAsFavorite(
      mediaType: mediaType,
      id: id,
      accountId: accountId,
      favorite: favorite,
      sessionId: sessionId,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelMessage data;
      data = new ModelMessage.fromJson(res.body);
      return data;
    }
  }

  Future<ModelUsersMovies> getFavoriteMovie({
    int page = 1,
    String sessionId,
    int accountId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    final res = await provider.getFavoriteMovie(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
      sortBy: sortBy,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelUsersMovies movies;
      movies = new ModelUsersMovies.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelUsersTv> getFavoriteTv({
    int page = 1,
    String sessionId,
    int accountId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    final res = await provider.getFavoriteTv(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
      sortBy: sortBy,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelUsersTv tv;
      tv = new ModelUsersTv.fromJson(res.body);
      return tv;
    }
  }

  Future<ModelUsersMovies> getWatchListMovie({
    int page = 1,
    String sessionId,
    int accountId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    final res = await provider.getWatchListMovie(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
      sortBy: sortBy,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelUsersMovies movies;
      movies = new ModelUsersMovies.fromJson(res.body);
      return movies;
    }
  }

  Future<ModelUsersTv> getWatchListTv({
    int page = 1,
    String sessionId,
    int accountId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    final res = await provider.getWatchListTv(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
      sortBy: sortBy,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      ModelUsersTv tv;
      tv = new ModelUsersTv.fromJson(res.body);
      return tv;
    }
  }

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
