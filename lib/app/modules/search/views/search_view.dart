import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/search_model.dart';

import '../controllers/search_controller.dart';

// ignore: must_be_immutable
class SearchView extends GetView<SearchController> {
  var controller = Get.find();

  String title(ModelSearchResult data) {
    switch (data.mediaType) {
      case MediaType.MOVIE:
        return data.title;
        break;
      case MediaType.TV:
        return data.name;
        break;
      case MediaType.PERSON:
        return data.name;
        break;
      default:
        return data.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: controller.obx((search) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(Get.parameters['keyword']),
              centerTitle: true,
              backgroundColor: Colors.redAccent,
            ),
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
                    onTap: () {
                      if (search.results[i].mediaType == MediaType.MOVIE) {
                        Get.toNamed("/detail/movie/${search.results[i].id}");
                      } else if (search.results[i].mediaType == MediaType.TV) {
                        Get.toNamed("/detail/tv/${search.results[i].id}");
                      }
                    },
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
                                image: search.results[i].posterPath == null
                                    ? AssetImage("assets/images/person.jpg")
                                    : CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500${search.results[i].posterPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              title(search.results[i]),
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
                childCount: search.results.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
