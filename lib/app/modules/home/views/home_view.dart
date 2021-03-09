import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/modules/home/views/home_header_view.dart';
import 'package:hypemovies/app/modules/home/views/home_list_movies_view.dart';
import 'package:hypemovies/app/modules/home/views/home_list_trending_view.dart';
import 'package:hypemovies/app/modules/home/views/home_list_tv_view.dart';
import 'package:hypemovies/app/views/label.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  TextEditingController _searchController = new TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(size: size, searchController: _searchController),
          ),
          SliverToBoxAdapter(
            child: LabelWidgets(
              firstText: "Trending",
              secondText: null,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: size.width,
              child: HomeListTrending(),
            ),
          ),
          SliverToBoxAdapter(
            child: LabelWidgets(
              firstText: "Discover Movies",
              secondText: "View All",
              onTap: () {
                Get.toNamed("/list/movie/${sortByValues.reverse[SortBy.POPULARITY_DECS]}");
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: size.width,
              child: HomeListMovies(),
            ),
          ),
          SliverToBoxAdapter(
            child: LabelWidgets(
              firstText: "Discover Tv",
              secondText: "View All",
              onTap: () {
                Get.toNamed("/list/tv/${sortByValues.reverse[SortBy.POPULARITY_DECS]}");
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: size.width,
              child: HomeListTv(),
            ),
          ),
        ],
      ),
    );
  }
}
