import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/providers/api_provider.dart';
import 'package:hypemovies/app/data/services/database.dart';
import 'package:hypemovies/app/modules/tabs/controllers/tabs_controller.dart';

import '../controllers/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
      () => UsersController(apiRepository: Get.find()),
    );
    Get.lazyPut<TabsController>(
      () => TabsController(apiRepository: Get.find()),
    );
    Get.lazyPut<ApiRepository>(() => ApiRepository(provider: Get.find()));
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<DbService>(() => DbService());
  }
}
