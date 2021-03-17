import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/services/database.dart';
import 'package:hypemovies/app/modules/users/views/favorite_movie.dart';
import 'package:hypemovies/app/modules/users/views/favorite_tv.dart';
import 'package:hypemovies/app/modules/users/views/watch_list_movie.dart';
import 'package:hypemovies/app/modules/users/views/watch_list_tv.dart';
import 'package:hypemovies/app/views/label.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  DbService db = Get.find<DbService>();
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    return Scaffold(
      body: db.sessionId.value == null
          ? Container(
              child: Center(
                child: TextButton(
                  child: Text(
                    "Please Login!",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    width: size.width,
                    height: size.height / 100 * 30,
                    child: Stack(
                      children: [
                        db.account.value.avatar == null
                            ? Image.asset(
                                "assets/images/not-found.png",
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height / 100 * 23,
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height / 100 * 23,
                                imageUrl: db.account.value.avatar == null
                                    ? "assets/images/not-found.png"
                                    : "https://www.gravatar.com/avatar/${db.account.value.avatar.gravatar.hash}",
                              ),
                        ClipRect(
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: new Container(
                              width: size.width,
                              height: size.height / 100 * 23,
                              decoration: new BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: size.height / 100 * 15,
                                    width: size.height / 100 * 15,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.redAccent,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: db.account.value.avatar == null
                                            ? AssetImage("assets/images/not-found.png")
                                            : CachedNetworkImageProvider(
                                                "https://www.gravatar.com/avatar/${db.account.value.avatar.gravatar.hash}",
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width - (size.height / 100 * 15) - 90,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    db.account.value.username == null ? "" : db.account.value.username,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headline4.copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                                Container(
                                  color: Colors.redAccent,
                                  width: 50,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.logout),
                                      color: Colors.white,
                                      onPressed: () => controller.logout(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LabelWidgets(
                    firstText: "Favorites Movies",
                    secondText: "View All",
                    onTap: () {
                      Get.toNamed("/favorites/movie/${sortByValues.reverse[SortBy.CREATED_AT_DESC]}");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    width: size.width,
                    child: UsersFavoriteMovieView(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LabelWidgets(
                    firstText: "Favorites Tv",
                    secondText: "View All",
                    onTap: () {
                      Get.toNamed("/favorites/tv/${sortByValues.reverse[SortBy.CREATED_AT_DESC]}");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    width: size.width,
                    child: UsersFavoriteTvView(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LabelWidgets(
                    firstText: "Watch List Movies",
                    secondText: "View All",
                    onTap: () {
                      Get.toNamed("/watchlist/movie/${sortByValues.reverse[SortBy.CREATED_AT_DESC]}");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    width: size.width,
                    child: UsersWatchListMovieView(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LabelWidgets(
                    firstText: "Watch List Tv",
                    secondText: "View All",
                    onTap: () {
                      Get.toNamed("/watchlist/tv/${sortByValues.reverse[SortBy.CREATED_AT_DESC]}");
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    width: size.width,
                    child: UsersWatchListTvView(),
                  ),
                ),
              ],
            ),
    );
  }
}
