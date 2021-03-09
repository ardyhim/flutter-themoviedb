import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';
import 'package:hypemovies/app/data/models/videos.dart';
import 'package:hypemovies/app/data/models/bookmarks.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController with StateMixin {
  DetailController({this.apiRepository});
  final ApiRepository apiRepository;
  var movies = new ModelMovies().obs;
  var videosMovies = new ModelVideos().obs;
  var similarMovies = new ModelSimilarMovies().obs;
  var similarTv = new ModelSimilarTv().obs;
  var videosTv = new ModelVideos().obs;
  var tv = new ModelTv().obs;
  var mediaType = mediaTypeValues.map[Get.parameters["type"]].obs;
  var id = Get.parameters["id"];
  var isBookmark = false.obs;

  fetchData() async {
    var box = await Hive.openBox<StoreBookmark>("bookmarks");
    StoreBookmark storeBookmark = box.get(int.parse(id));
    storeBookmark == null ? isBookmark.value = false : isBookmark.value = true;
    change("detail", status: RxStatus.loading());
    if (identical(mediaType.value, MediaType.MOVIE)) {
      movies.value = await apiRepository.getDetailMovies(id: id);
      videosMovies.value = await apiRepository.getVideosMovies(id: id);
      similarMovies.value = await apiRepository.getSimilarMovies(id: id);
      change(movies.value, status: RxStatus.success());
    } else {
      tv.value = await apiRepository.getDetailTv(id: id);
      videosTv.value = await apiRepository.getVideosTv(id: id);
      similarTv.value = await apiRepository.getSimilarTv(id: id);
      change(tv.value, status: RxStatus.success());
    }
  }

  fetchBookmarks() async {
    print(isBookmark.value);
  }

  removeBookmarks() async {
    var box = Hive.box<StoreBookmark>("bookmarks");
    await box.delete(int.parse(id));
    isBookmark.value = false;
  }

  addBookmarks() async {
    var box = await Hive.openBox<StoreBookmark>("bookmarks");
    StoreBookmark storeBookmark;
    if (identical(mediaType.value, MediaType.MOVIE)) {
      storeBookmark = StoreBookmark(
        id: int.parse(id),
        name: movies.value.title,
        overview: movies.value.overview,
        voteAverage: movies.value.voteAverage,
        genres: movies.value.genres,
        posterPath: movies.value.posterPath,
        mediaType: MediaType.MOVIE,
      );
    } else {
      storeBookmark = StoreBookmark(
          id: int.parse(id),
          name: tv.value.name,
          overview: tv.value.overview,
          voteAverage: tv.value.voteAverage,
          genres: tv.value.genres,
          posterPath: tv.value.posterPath,
          mediaType: MediaType.TV);
    }
    await box.put(int.parse(id), storeBookmark);
    isBookmark.value = true;
  }

  launchUrl({String key}) async {
    String url = "https://www.youtube.com/watch?v=$key";
    if (Platform.isIOS) {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch';
      }
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
