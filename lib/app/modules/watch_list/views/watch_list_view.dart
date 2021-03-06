import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';

import '../controllers/watch_list_controller.dart';

class WatchListView extends GetView<WatchListController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ScrollController scrollController = new ScrollController();

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: GetX<WatchListController>(
        init: Get.find(),
        builder: (lc) {
          return NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                if (lc.isMore.value && !lc.isLoading.value) {
                  lc.page.value++;
                  lc.fetchData();
                }
              }
              return true;
            },
            child: CustomScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: Text("WATCH LIST"),
                  backgroundColor: Colors.redAccent,
                  centerTitle: true,
                ),
                if (identical(lc.mediaType.value, MediaType.MOVIE))
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, int i) {
                        return GestureDetector(
                          onTap: () => Get.toNamed("/detail/movie/${lc.movies.value.results[i].id}"),
                          child: Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: lc.movies.value.results[i].posterPath == null
                                          ? AssetImage("assets/images/not-found.png")
                                          : CachedNetworkImageProvider("https://image.tmdb.org/t/p/w185${lc.movies.value.results[i].posterPath}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    lc.movies.value.results[i].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: lc.movies.value.results == null ? 0 : lc.movies.value.results.length,
                    ),
                  ),
                if (identical(lc.mediaType.value, MediaType.TV))
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, int i) {
                        return GestureDetector(
                          onTap: () => Get.toNamed("/detail/tv/${lc.tv.value.results[i].id}"),
                          child: Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: lc.tv.value.results[i].posterPath == null
                                          ? AssetImage("assets/images/not-found.png")
                                          : CachedNetworkImageProvider("https://image.tmdb.org/t/p/w185${lc.tv.value.results[i].posterPath}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    lc.tv.value.results[i].name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: lc.tv.value.results == null ? 0 : lc.tv.value.results.length,
                    ),
                  ),
                if (lc.isLoading.value)
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
