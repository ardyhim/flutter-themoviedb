import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/users_movies.dart';
import 'package:hypemovies/app/data/models/users_tv.dart';
import 'package:hypemovies/app/data/services/database.dart';

class FavoritesController extends GetxController {
  FavoritesController({this.apiRepository});
  DbService db = Get.find<DbService>();
  final ApiRepository apiRepository;
  var mediaType = mediaTypeValues.map[Get.parameters["category"]].obs;
  var sortBy = sortByValues.map[Get.parameters["sortBy"]].obs;
  var movies = new ModelUsersMovies().obs;
  var tv = new ModelUsersTv().obs;
  var page = 1.obs;
  var isMore = true.obs;
  var isLoading = true.obs;

  fetchData() async {
    isLoading.value = true;
    if (identical(mediaType.value, MediaType.TV)) {
      ModelUsersTv data = await apiRepository.getFavoriteTv(
        sortBy: sortBy.value,
        page: page.value,
        sessionId: db.sessionId.value,
        accountId: db.account.value.id,
      );
      if (tv.value.results == null) {
        tv.value = data;
      } else {
        tv.value.results.addAll(data.results);
      }
      if (data.results.length < 20) isMore.value = false;
      isLoading.value = false;
    } else {
      ModelUsersMovies data = await apiRepository.getFavoriteMovie(
        sortBy: sortBy.value,
        page: page.value,
        sessionId: db.sessionId.value,
        accountId: db.account.value.id,
      );
      if (movies.value.results == null) {
        movies.value = data;
      } else {
        movies.value.results.addAll(data.results);
      }
      if (data.results.length < 20) isMore.value = false;
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
