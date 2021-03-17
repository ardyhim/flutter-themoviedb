import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/account.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/users_movies.dart';
import 'package:hypemovies/app/data/models/users_tv.dart';
import 'package:hypemovies/app/data/services/database.dart';

class UsersController extends GetxController {
  UsersController({this.apiRepository});
  final ApiRepository apiRepository;
  DbService db = Get.find<DbService>();
  var users = new ModelAccount().obs;
  var favoriteMovies = new ModelUsersMovies().obs;
  var favoriteTv = new ModelUsersTv().obs;
  var watchListMovies = new ModelUsersMovies().obs;
  var watchListTv = new ModelUsersTv().obs;

  fetchData() async {
    favoriteMovies.value = await apiRepository.getFavoriteMovie(
      page: 1,
      sessionId: db.sessionId.value,
      accountId: db.account.value.id,
      sortBy: SortBy.CREATED_AT_DESC,
    );
    favoriteTv.value = await apiRepository.getFavoriteTv(
      page: 1,
      sessionId: db.sessionId.value,
      accountId: db.account.value.id,
      sortBy: SortBy.CREATED_AT_DESC,
    );
    watchListMovies.value = await apiRepository.getWatchListMovie(
      page: 1,
      sessionId: db.sessionId.value,
      accountId: db.account.value.id,
      sortBy: SortBy.CREATED_AT_DESC,
    );
    watchListTv.value = await apiRepository.getWatchListTv(
      page: 1,
      sessionId: db.sessionId.value,
      accountId: db.account.value.id,
      sortBy: SortBy.CREATED_AT_DESC,
    );
  }

  logout() async {
    await apiRepository.deleteSession(sessionId: db.sessionId.value);
    db.remove();
    Get.offNamed("/login");
  }

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
