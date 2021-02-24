import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/movies_list_model.dart';

class ListController extends GetxController {
  ListController({this.apiRepository});
  final ApiRepository apiRepository;
  var movies = RxList<MoviesList>().obs;
  RxString _category = Get.parameters["category"].obs;

  var list = RxList().obs;

  get category => _category;
  set category(value) {
    _category.value = value;
    update();
  }

  loadMore() async {
    list.update((val) {
      val.addAll([1, 2, 3, 4, 5]);
    });
    // movies.update((val) async {
    //   var data = await apiRepository.getLatestMovies();
    //   val.addAll(data);
    //   update();
    // });
  }

  @override
  void onInit() async {
    loadMore();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
