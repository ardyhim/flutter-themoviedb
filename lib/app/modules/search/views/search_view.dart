import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

// ignore: must_be_immutable
class SearchView extends GetView<SearchController> {
  var controller = Get.find();

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
                    onTap: () => Get.toNamed("/detail/movie/${search.movie[i].videosId}"),
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
                                image: CachedNetworkImageProvider(search.movie[i].thumbnailUrl),
                                // image: NetworkImage(search.movie[i].thumbnailUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              search.movie[i].title,
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
                childCount: search.movie.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
