import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';

class DetailController extends GetxController with StateMixin {
  DetailController({this.apiRepository});
  final ApiRepository apiRepository;
  var movies = ModelMovies().obs;
  var similarMovies = ModelSimilarMovies().obs;
  var similarTv = ModelSimilarTv().obs;
  var tv = ModelTv().obs;
  var mediaType = mediaTypeValues.map[Get.parameters["type"]].obs;

  fetchData() async {
    change("detail", status: RxStatus.loading());
    if (identical(mediaType, MediaType.MOVIE)) {
      movies.value = await apiRepository.getDetailMovies(id: Get.parameters["id"]);
      similarMovies.value = await apiRepository.getSimilarMovies(id: Get.parameters["id"]);
      change(movies.value, status: RxStatus.success());
    } else {
      tv.value = await apiRepository.getDetailTv(id: Get.parameters["id"]);
      similarTv.value = await apiRepository.getSimilarTv(id: Get.parameters["id"]);
      change(tv.value, status: RxStatus.success());
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
