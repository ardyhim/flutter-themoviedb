import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/discover_movies.dart';
import 'package:hypemovies/app/data/models/discover_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';

class ListController extends GetxController {
  ListController({this.apiRepository});
  final ApiRepository apiRepository;
  var mediaType = mediaTypeValues.map[Get.parameters["category"]].obs;
  var sortBy = sortByValues.map[Get.parameters["sortBy"]].obs;
  var movies = new ModelDiscoverMovies().obs;
  var tv = new ModelDiscoverTv().obs;
  var page = 1.obs;
  var isMore = true.obs;
  var isLoading = true.obs;

  fetchData() async {
    isLoading.value = true;
    if (identical(mediaType.value, MediaType.TV)) {
      ModelDiscoverTv data = await apiRepository.getDiscoverTv(
        sortBy: sortBy.value,
        page: page.value,
      );
      if (tv.value.results == null) {
        tv.value = data;
      } else {
        tv.value.results.addAll(data.results);
      }
      if (data.results.length < 20) isMore.value = false;
      isLoading.value = false;
    } else {
      ModelDiscoverMovies data = await apiRepository.getDiscoverMovie(
        sortBy: sortBy.value,
        page: page.value,
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

  @override
  void onClose() {}
}
