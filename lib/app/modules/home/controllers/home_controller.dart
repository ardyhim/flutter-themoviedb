import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/discover_movies.dart';
import 'package:hypemovies/app/data/models/discover_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/trending_model.dart';

class HomeController extends SuperController {
  HomeController({this.apiRepository});
  final ApiRepository apiRepository;
  var movies = new ModelDiscoverMovies().obs;
  var tv = new ModelDiscoverTv().obs;
  var trending = ModelTrending().obs;

  fetchData() async {
    trending.value = await apiRepository.getTrending(
      mediaType: MediaType.ALL,
      timeWindow: TimeWindow.DAY,
    );
    movies.value = await apiRepository.getDiscoverMovie();
    tv.value = await apiRepository.getDiscoverTv();
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
