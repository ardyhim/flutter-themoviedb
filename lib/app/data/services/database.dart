import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hypemovies/app/data/models/account.dart';

class DbService extends GetxService {
  Box setting;
  var sessionId = "".obs;
  var token = "".obs;
  var account = ModelAccount().obs;
  Future<DbService> init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(StoreBookmarkAdapter());
    // Hive.registerAdapter(MediaTypeAdapter());
    // Hive.registerAdapter(GenreAdapter());
    if (Hive.isBoxOpen("setting"))
      setting = Hive.box("setting");
    else
      setting = await Hive.openBox("setting");
    sessionId.value = await setting.get("session_id");
    print(sessionId.value);
    return this;
  }

  saveSession(value) {
    sessionId.value = value;
    setting.put("session_id", value);
  }

  remove() async {
    setting.delete("session_id");
  }
}
