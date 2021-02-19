import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/movies_search_model.dart';

class SearchController extends GetxController with StateMixin<MoviesSearch> {
  SearchController({this.apiRepository});
  final ApiRepository apiRepository;
  var search = MoviesSearch().obs;
  @override
  void onInit() async {
    change(MoviesSearch(), status: RxStatus.loading());
    search.value = await apiRepository.getSearch(
      keyword: Get.parameters["keyword"],
      page: Get.parameters["page"],
    );
    change(search.value, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
