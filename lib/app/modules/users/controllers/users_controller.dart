import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/account.dart';
import 'package:hypemovies/app/data/services/database.dart';

class UsersController extends GetxController {
  UsersController({this.apiRepository});
  final ApiRepository apiRepository;
  var users = new ModelAccount().obs;
  DbService db = Get.find<DbService>();

  test() {
    print(db.account.value);
  }

  fetchData() async {
    // users.value = await apiRepository.getAccount();
    // print(users.value);
  }

  logout() async {
    db.remove();
    Get.offNamed("/login");
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    // await fetchData();
    super.onReady();
  }

  @override
  void onClose() {}
}
