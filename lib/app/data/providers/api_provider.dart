import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';

class ApiProvider extends GetConnect {
  Map<String, String> queryApi = {"api_key": "e3759057a7b881a632632b371ca441d5"};
  @override
  void onInit() async {
    print("api provider init");
    httpClient.baseUrl = 'https://api.themoviedb.org/3/';
    httpClient.addRequestModifier((request) {
      request.headers['api_key'] = 'e3759057a7b881a632632b371ca441d5';
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      request.headers["Access-Control-Allow-Origin"] = "*";
      return request;
    });
  }

  Future<Response> createRequestToken() async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/authentication/token/new",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> createSessionWithLogin({
    String token,
    String username,
    String password,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await post(
      "/authentication/token/validate_with_login",
      {
        "username": username,
        "password": password,
        "request_token": token,
      },
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> createSession({
    String token,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await post(
      "/authentication/session/new",
      {
        "request_token": token,
      },
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> createGuestSession({
    String token,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await post(
      "/authentication/guest_session/new",
      {
        "request_token": token,
      },
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> deleteSession({
    String sessionId,
  }) async {
    Response res = await request(
      "/authentication/session",
      "DELETE",
      query: {...queryApi},
      body: {
        "session_id": sessionId,
      },
    );
    return res;
  }

  Future<Response> getAccountStates({
    String id,
    String sessionId,
    MediaType mediaType,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/${mediaTypeValues.reverse[mediaType]}/$id/account_states",
      query: {
        "session_id": sessionId,
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getAccount({
    String sessionId,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/account",
      query: {
        "session_id": sessionId,
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> markAsFavorite({
    MediaType mediaType,
    String id,
    int accountId,
    String sessionId,
    bool favorite = true,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Map data = {
      "media_type": mediaTypeValues.reverse[mediaType],
      "media_id": int.parse(id),
      "favorite": favorite,
    };
    Response res = await post(
      "/account/$accountId/favorite",
      data,
      query: {
        "session_id": sessionId,
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getFavoriteMovie({
    int page = 1,
    int accountId,
    String sessionId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/account/$accountId/favorite/movies",
      query: {
        "session_id": sessionId,
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getFavoriteTv({
    int page = 1,
    int accountId,
    String sessionId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/account/$accountId/favorite/tv",
      query: {
        "session_id": sessionId,
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getWatchListMovie({
    int page = 1,
    int accountId,
    String sessionId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/account/$accountId/watchlist/movies",
      query: {
        "session_id": sessionId,
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getWatchListTv({
    int page = 1,
    int accountId,
    String sessionId,
    SortBy sortBy = SortBy.CREATED_AT_DESC,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/account/$accountId/watchlist/tv",
      query: {
        "session_id": sessionId,
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getDiscoverMovie({
    int page = 1,
    SortBy sortBy = SortBy.POPULARITY_DECS,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/discover/movie",
      query: {
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getDiscoverTv({
    int page = 1,
    SortBy sortBy = SortBy.POPULARITY_DECS,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/discover/tv",
      query: {
        "sort_by": sortByValues.reverse[sortBy],
        "page": page.toString(),
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getSearch({int page = 1, String query}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/search/multi",
      query: {
        "page": page.toString(),
        "query": query,
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getTrending({
    MediaType mediaType = MediaType.MOVIE,
    TimeWindow timeWindow = TimeWindow.DAY,
  }) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/trending/${mediaTypeValues.reverse[mediaType]}/${timeWindowValues.reverse[timeWindow]}",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getDetailMovies({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/movie/$id",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getSimilarMovies({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/movie/$id/similar",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getVideosMovies({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/movie/$id/videos",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getDetailTv({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/tv/$id",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getSimilarTv({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/tv/$id/similar",
      query: {...queryApi},
    );
    return res;
  }

  Future<Response> getVideosTv({String id}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/tv/$id/videos",
      query: {...queryApi},
    );
    return res;
  }
}
