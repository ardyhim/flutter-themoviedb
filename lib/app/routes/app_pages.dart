import 'package:get/get.dart';

import 'package:hypemovies/app/modules/detail/bindings/detail_binding.dart';
import 'package:hypemovies/app/modules/detail/views/detail_view.dart';
import 'package:hypemovies/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:hypemovies/app/modules/favorite/views/favorite_view.dart';
import 'package:hypemovies/app/modules/favorites/bindings/favorites_binding.dart';
import 'package:hypemovies/app/modules/favorites/views/favorites_view.dart';
import 'package:hypemovies/app/modules/home/bindings/home_binding.dart';
import 'package:hypemovies/app/modules/home/views/home_view.dart';
import 'package:hypemovies/app/modules/list/bindings/list_binding.dart';
import 'package:hypemovies/app/modules/list/views/list_view.dart';
import 'package:hypemovies/app/modules/login/bindings/login_binding.dart';
import 'package:hypemovies/app/modules/login/views/login_view.dart';
import 'package:hypemovies/app/modules/search/bindings/search_binding.dart';
import 'package:hypemovies/app/modules/search/views/search_view.dart';
import 'package:hypemovies/app/modules/tabs/bindings/tabs_binding.dart';
import 'package:hypemovies/app/modules/tabs/views/tabs_view.dart';
import 'package:hypemovies/app/modules/users/bindings/users_binding.dart';
import 'package:hypemovies/app/modules/users/views/users_view.dart';
import 'package:hypemovies/app/modules/watch_list/bindings/watch_list_binding.dart';
import 'package:hypemovies/app/modules/watch_list/views/watch_list_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => ListView(),
      binding: ListBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.WATCH_LIST,
      page: () => WatchListView(),
      binding: WatchListBinding(),
    ),
  ];
}
