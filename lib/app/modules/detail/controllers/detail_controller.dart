import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/movies_detail_model.dart';

class DetailController extends GetxController with StateMixin<MoviesDetail> {
  DetailController({this.apiRepository});
  final ApiRepository apiRepository;
  var movies = MoviesDetail().obs;

  final count = 0.obs;
  @override
  void onInit() async {
    // change(MoviesDetail(), status: RxStatus.loading());
    // movies.value = await apiRepository.getDetails(
    //   type: Get.parameters["type"],
    //   id: Get.parameters["id"],
    // );

    change(movies.value, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
