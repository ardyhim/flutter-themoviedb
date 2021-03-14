import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/services/database.dart';
import 'package:hypemovies/app/modules/home/bindings/home_binding.dart';
import 'package:hypemovies/app/modules/home/views/home_view.dart';
import 'package:hypemovies/app/modules/users/bindings/users_binding.dart';
import 'package:hypemovies/app/modules/users/views/users_view.dart';

class TabsController extends GetxController {
  TabsController({this.apiRepository});
  final ApiRepository apiRepository;
  final pages = <String>['/home', '/users'];
  var currentIndex = 0.obs;

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home')
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
      );

    if (settings.name == '/users')
      return GetPageRoute(
        settings: settings,
        page: () => UsersView(),
        binding: UsersBinding(),
      );

    return null;
  }

  fetchData() async {
    DbService db = Get.find<DbService>();
    if (db.sessionId.value != null) db.account.value = await apiRepository.getAccount(sessionId: db.sessionId.value);
  }

  void changeTab(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  @override
  void onInit() async {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
