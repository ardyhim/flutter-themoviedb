import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/modules/home/controllers/home_controller.dart';

class HomeListTrending extends StatelessWidget {
  const HomeListTrending({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: Get.find(),
      builder: (val) {
        return ListView.builder(
          itemCount: val.trending.value.results == null ? 0 : val.trending.value.results.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int i) {
            return GestureDetector(
              onTap: () {
                String route = "/detail/${mediaTypeValues.reverse[val.trending.value.results[i].mediaType]}/${val.trending.value.results[i].id}";
                Get.toNamed(route);
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
                          image: val.trending.value.results[i].posterPath == null
                              ? AssetImage("/assets/images/not-found.png")
                              : CachedNetworkImageProvider("https://image.tmdb.org/t/p/w185${val.trending.value.results[i].posterPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        val.trending.value.results[i].title == null ? val.trending.value.results[i].name : val.trending.value.results[i].title,
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
