import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/services/database.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.redAccent,
      ),
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => DbService().init());
}
