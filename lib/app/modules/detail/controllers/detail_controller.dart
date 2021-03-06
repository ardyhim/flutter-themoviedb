import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';
import 'package:hypemovies/app/data/models/videos.dart';
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

  fetchData() async {
    change("detail", status: RxStatus.loading());
    if (identical(mediaType.value, MediaType.MOVIE)) {
      movies.value = await apiRepository.getDetailMovies(id: Get.parameters["id"]);
      videosMovies.value = await apiRepository.getVideosMovies(id: Get.parameters["id"]);
      similarMovies.value = await apiRepository.getSimilarMovies(id: Get.parameters["id"]);
      change(movies.value, status: RxStatus.success());
    } else {
      tv.value = await apiRepository.getDetailTv(id: Get.parameters["id"]);
      videosTv.value = await apiRepository.getVideosTv(id: Get.parameters["id"]);
      similarTv.value = await apiRepository.getSimilarTv(id: Get.parameters["id"]);
      change(tv.value, status: RxStatus.success());
    }
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
