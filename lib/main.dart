import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hypemovies/app/data/models/bookmarks.dart';
import 'package:hypemovies/app/data/models/enum.dart';
import 'package:hypemovies/app/data/models/genres.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StoreBookmarkAdapter());
  Hive.registerAdapter(MediaTypeAdapter());
  Hive.registerAdapter(GenreAdapter());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.redAccent,
      ),
    ),
  );
}
