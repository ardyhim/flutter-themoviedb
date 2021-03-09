import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hypemovies/app/modules/detail/controllers/detail_controller.dart';
import 'package:hypemovies/app/views/button_widgets.dart';
import 'package:hypemovies/app/views/clipper.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailMovieView extends GetView {
  DetailController controller = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500${controller.movies.value.posterPath}"),
                ),
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 180,
                    child: MaterialButton(
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      color: Colors.redAccent,
                      onPressed: () {},
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 180,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500${controller.movies.value.backdropPath}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 35,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: Obx(
                      () => controller.isBookmark.value == false
                          ? IconButton(
                              icon: Icon(
                                Icons.bookmark_outline_rounded,
                                size: 35,
                                color: Colors.redAccent,
                              ),
                              onPressed: () => controller.addBookmarks(),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.bookmark_rounded,
                                size: 35,
                                color: Colors.redAccent,
                              ),
                              onPressed: () => controller.removeBookmarks(),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.movies.value.genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int i) {
                  return Container(
                    margin: i == 0 ? EdgeInsets.only(right: 5, left: 20) : EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(
                      backgroundColor: Colors.redAccent,
                      elevation: 1,
                      label: Text(
                        controller.movies.value.genres[i].name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      controller.movies.value.title,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                        height: 40,
                        elevation: 1,
                        text: controller.movies.value.voteAverage.toString(),
                        firstColor: Colors.redAccent,
                        secondColor: Colors.redAccent,
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.movies.value.releaseDate.year.toString(),
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.movies.value.overview,
                style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              child: TabBar(
                labelColor: Colors.black87,
                indicatorColor: Colors.redAccent,
                labelStyle: Theme.of(context).textTheme.subtitle2,
                tabs: [
                  Tab(text: "Related"),
                  Tab(text: "Videos"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 210,
              child: TabBarView(
                children: <Widget>[
                  Container(
                    child: ListView.builder(
                      itemCount: controller.similarMovies.value.results.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int i) {
                        return Container(
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500${controller.similarMovies.value.results[i].posterPath}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  controller.similarMovies.value.results[i].title,
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
                        );
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: controller.videosMovies.value.results == null ? 0 : controller.videosMovies.value.results.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int i) {
                        return Container(
                          width: 320,
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      "https://img.youtube.com/vi/${controller.videosMovies.value.results[i].key}/mqdefault.jpg",
                                    ),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: CircleBorder(),
                                color: Colors.transparent,
                                onPressed: () => controller.launchUrl(key: controller.videosMovies.value.results[i].key),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  width: 320,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      controller.videosMovies.value.results[i].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.headline4.copyWith(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
