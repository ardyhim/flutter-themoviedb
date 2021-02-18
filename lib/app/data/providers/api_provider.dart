import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/movies_list_model.dart';
// import 'package:dio/dio.dart';

class ApiProvider extends GetConnect {
  // Dio dio = Dio();
  Map<String, String> queryApi = {"api_secret_key": "aa3729572ca0be9"};
  @override
  void onInit() {
    print("api provider init");
    httpClient.baseUrl = 'https://hypemovies.xyz/api';
    httpClient.addRequestModifier((request) {
      request.headers['api_secret_key'] = 'aa3729572ca0be9';
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      return request;
    });
    // BaseOptions options = new BaseOptions(
    //     baseUrl: "https://hypemovies.xyz/api/", connectTimeout: 5000, receiveTimeout: 3000, queryParameters: {"api_secret_key": "aa3729572ca0be9"});
    // dio = new Dio(options);
  }

  Future<Response> getLatestMovies({int page = 1}) async {
    httpClient.baseUrl = 'https://hypemovies.xyz/api';
    Response res = await get(
      "/get_latest_movies",
      query: {"page": page.toString(), ...queryApi},
    );
    return res;
  }

  Future<Response> getDetails({
    String type = "movie",
    id,
  }) async {
    httpClient.baseUrl = 'https://hypemovies.xyz/api';
    Response res = await get(
      "/get_single_details",
      query: {
        "type": type,
        "id": id,
        ...queryApi,
      },
    );
    return res;
  }

  Future<Response> getTvSeries() async {
    httpClient.baseUrl = 'https://hypemovies.xyz/api';
    Response res = await get(
      "/get_tvseries",
      query: queryApi,
    );
    return res;
  }

  Future<Response> getSearch({String keyword, int page = 1}) async {
    httpClient.baseUrl = 'https://hypemovies.xyz/api';
    Response res = await get(
      "/search",
      query: {
        "page": page.toString(),
        "q": keyword,
        ...queryApi,
      },
    );
    return res;
  }
}
