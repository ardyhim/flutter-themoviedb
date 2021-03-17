import 'package:get/get.dart';
import 'package:hypemovies/app/data/controllers/api_repository.dart';
import 'package:hypemovies/app/data/models/create_session.dart';
import 'package:hypemovies/app/data/models/guest_session.dart';
import 'package:hypemovies/app/data/models/session_with_login.dart';
import 'package:hypemovies/app/data/services/database.dart';

class LoginController extends GetxController {
  LoginController({this.apiRepository});
  final ApiRepository apiRepository;
  var isLoading = false.obs;
  DbService db = Get.find<DbService>();

  // loginAsGuest() async {
  //   isLoading.value = true;
  //   ModelSessionWithLogin resToken = await apiRepository.createRequestToken();
  //   ModelGuestSession resSession = await apiRepository.createGuestSession(token: resToken.requestToken);
  //   db.token.value = resToken.requestToken;
  //   db.saveSession(resSession.guestSessionId);
  // }

  login({String username, String password}) async {
    isLoading.value = true;
    ModelSessionWithLogin resToken = await apiRepository.createRequestToken();
    ModelSessionWithLogin validate = await apiRepository.createSessionWithLogin(
      username: username,
      password: password,
      token: resToken.requestToken,
    );
    ModelCreateSession resSession = await apiRepository.createSession(token: validate.requestToken);
    db.token.value = validate.requestToken;
    db.saveSession(resSession.sessionId);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
