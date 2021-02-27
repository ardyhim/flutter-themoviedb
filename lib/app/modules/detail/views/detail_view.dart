import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/modules/detail/views/movie_view.dart';
import 'package:hypemovies/app/modules/detail/views/tv_view.dart';

import '../controllers/detail_controller.dart';

// ignore: must_be_immutable
class DetailView extends GetView<DetailController> {
  var controller = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (movie) {
          if (identical(controller.mediaType, MediaType.MOVIE))
            return DetailMovieView();
          else
            return DetailTvView();
        },
      ),
    );
  }
}
