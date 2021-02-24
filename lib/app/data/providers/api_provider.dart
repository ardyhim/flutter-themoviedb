import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';

class ApiProvider extends GetConnect {
  Map<String, String> queryApi = {"api_key": "e3759057a7b881a632632b371ca441d5"};
  @override
  void onInit() {
    print("api provider init");
    httpClient.baseUrl = 'https://api.themoviedb.org/3/';
    httpClient.addRequestModifier((request) {
      request.headers['api_key'] = 'e3759057a7b881a632632b371ca441d5';
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Response> getDiscoverMovie({int page = 1}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/discover/movie",
      query: {"page": page.toString(), ...queryApi},
    );
    return res;
  }

  Future<Response> getDiscoverTv({int page = 1}) async {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    Response res = await get(
      "/discover/tv",
      query: {"page": page.toString(), ...queryApi},
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
}
