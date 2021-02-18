import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/views/button_widgets.dart';
import 'package:hypemovies/app/views/clipper.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  var controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    return Scaffold(
      body: controller.obx(
        (movie) {
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
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: NetworkImage(movie.posterUrl),
                      // ),
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
                              // gradient: LinearGradient(
                              //   begin: Alignment.topRight,
                              //   end: Alignment.bottomLeft,
                              //   colors: [
                              //     Color(0xFF3383CD),
                              //     Color(0xFF11249F),
                              //   ],
                              // ),
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
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(5),
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: NetworkImage(movie.thumbnailUrl),
                                // ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_rounded),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ],
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
                            "The Walking Dead 2",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
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
                              // padding: EdgeInsets.all(20),
                              text: '132 min',
                              firstColor: Colors.yellowAccent,
                              secondColor: Colors.orangeAccent,
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
                    width: size.width,
                    height: 50,
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int i) {
                        return Container(
                          margin: i == 0
                              ? EdgeInsets.only(right: 5, left: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                          child: Chip(
                            backgroundColor: Colors.orangeAccent,
                            elevation: 1,
                            label: Text(
                              "HELLO $i",
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
                    child: Text(
                      "When the crew of a space junk collector ship called The Victory discovers a humanoid robot named Dorothy that's known to be a weapon of mass destruction, they get involved in a risky business deal which puts their lives at stake.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: size.width,
                    // height: 100,
                    // color: Colors.orangeAccent,
                    child: TabBar(
                      labelColor: Colors.black87,
                      indicatorColor: Colors.orangeAccent,
                      labelStyle: Theme.of(context).textTheme.subtitle2,
                      tabs: [
                        Tab(text: "Related"),
                        Tab(text: "Cast"),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: size.width,
                    height: 200,
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          child: ListView.builder(
                            itemCount: 10,
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
                                        // image: DecorationImage(
                                        //   image: NetworkImage(val.moviesPopular.value[i].thumbnailUrl),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "title related",
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
                            itemCount: 10,
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
                                        // image: DecorationImage(
                                        //   image: NetworkImage(val.moviesPopular.value[i].thumbnailUrl),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "title related",
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
                      ],
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
