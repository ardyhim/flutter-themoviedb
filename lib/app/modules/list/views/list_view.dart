import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class ListView extends GetView<ListController> {
  // ListController lc = Get.find<ListController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: GetBuilder<ListController>(
        init: Get.find(),
        builder: (lc) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(lc.category.value),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      // print(lc.movies.value);
                      // lc.category = "update";
                      lc.loadMore();
                    },
                    child: Text("GET"),
                  ),
                ),
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
                    return Container(
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
                                image: NetworkImage(lc.movies.value[i].thumbnailUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed("/detail/movie/${lc.movies.value[i].videosId}"),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                lc.movies.value[i].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: lc.movies.value.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
