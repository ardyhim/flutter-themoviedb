import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/search_model.dart';

class SearchController extends GetxController with StateMixin<ModelSearch> {
  SearchController({this.apiRepository});
  final ApiRepository apiRepository;
  var search = ModelSearch().obs;
  var page = 1.obs;
  @override
  void onInit() async {
    change(ModelSearch(), status: RxStatus.loading());
    search.value = await apiRepository.getSearch(
      query: Get.parameters["keyword"],
      page: page.value,
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
