import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/modules/home/controllers/home_controller.dart';

class HomeListTv extends StatelessWidget {
  const HomeListTv({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: Get.find(),
      builder: (val) {
        return ListView.builder(
          itemCount: val.tv.value.results == null ? 0 : val.tv.value.results.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int i) {
            return GestureDetector(
              onTap: () {
                Get.toNamed("/detail/tv/${val.tv.value.results[i].id}");
              },
              child: Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: val.tv.value.results[i].posterPath == null
                              ? AssetImage("/assets/images/not-found.png")
                              : CachedNetworkImageProvider("https://image.tmdb.org/t/p/w185${val.tv.value.results[i].posterPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "${val.tv.value.results[i].name}",
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
        );
      },
    );
  }
}
