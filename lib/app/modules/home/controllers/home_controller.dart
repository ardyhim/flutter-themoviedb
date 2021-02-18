import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/movies_list_model.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';

class HomeController extends SuperController {
  HomeController({this.apiRepository});
  final ApiRepository apiRepository;
  List<MoviesList> movies = [];
  var moviesPopular = RxList<MoviesList>().obs;
  final count = 0.obs;
  @override
  void onInit() async {
    moviesPopular.update((val) async {
      var data = await apiRepository.getLatestMovies();
      val.addAll(data);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getM() async {
    // moviesPopular.update((val) async {
    //   var data = await apiRepository.getLatestMovies();
    //   val.addAll(data);
    // });
    // MoviesList movie = new MoviesList(
    //   title: "Inside Out",
    //   thumbnailUrl: "https://source.unsplash.com/500x300/?poster",
    // );
    // movies.add(movie);
    // update();
    print("getm controler");
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
