import 'dart:io';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/account_state.dart';
import 'package:hypemovies/app/data/models/detail_movies.dart';
import 'package:hypemovies/app/data/models/detail_tv.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/similar_movies.dart';
import 'package:hypemovies/app/data/models/similar_tv.dart';
import 'package:hypemovies/app/data/models/videos.dart';
import 'package:hypemovies/app/data/services/database.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController with StateMixin {
  DetailController({this.apiRepository});
  final ApiRepository apiRepository;
  DbService db = Get.find<DbService>();
  var accountStates = new ModelAccountState().obs;
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
    if (db.sessionId.value != null)
      accountStates.value = await apiRepository.getAccountStates(
        id: id,
        mediaType: mediaType.value,
        sessionId: db.sessionId.value,
      );
  }

  markAsFavorite() async {
    await apiRepository.markAsFavorite(
      id: id,
      mediaType: mediaType.value,
      favorite: !accountStates.value.favorite,
      accountId: db.account.value.id,
      sessionId: db.sessionId.value,
    );
    accountStates.value.favorite = !accountStates.value.favorite;
    update();
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
