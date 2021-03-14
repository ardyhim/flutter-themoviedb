import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hypemovies/app/data/services/database.dart';
import 'package:hypemovies/app/modules/tabs/controllers/tabs_controller.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    TabsController tabsController = Get.find<TabsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersView'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: GetX<DbService>(
                init: Get.find<DbService>(),
                builder: (db) {
                  return Text(
                    "${db.account.value.username}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: GetX<DbService>(
                init: Get.find<DbService>(),
                builder: (db) {
                  return Text(
                    "${db.sessionId.value}",
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                Get.offNamed("/login");
              },
              child: Text("LOGIN"),
            ),
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                // Get.offNamed("/login");
                // db.sessionId.value = "abc";
              },
              child: Text("Db Test"),
            ),
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("LOGOUT"),
            ),
          ),
        ],
      ),
    );
  }
}
