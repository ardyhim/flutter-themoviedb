import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/views/button_widgets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
    @required this.size,
    @required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final Size size;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 250,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "https://source.unsplash.com/500x300/?design",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(40.0),
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        onSubmitted: (v) {
                          if (_searchController.text != "") Get.toNamed("/search/${_searchController.text}");
                        },
                        decoration: InputDecoration(
                          hintText: "Search for movies,tv show...",
                          focusColor: Colors.redAccent,
                          fillColor: Colors.white70,
                          suffixIcon: IconButton(
                            color: Colors.redAccent,
                            icon: Icon(Icons.search),
                            onPressed: () {
                              if (_searchController.text != "") Get.toNamed("/search/${_searchController.text}");
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(color: Colors.redAccent, width: 2),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 100,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            text: 'Movies',
                            onTap: () => Get.toNamed("/list/movie/${sortByValues.reverse[SortBy.POPULARITY_DECS]}"),
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            height: 100,
                            firstColor: Colors.yellow,
                            secondColor: Colors.orangeAccent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            text: 'Tv Series',
                            onTap: () => Get.toNamed("/list/tv/${sortByValues.reverse[SortBy.POPULARITY_DECS]}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
