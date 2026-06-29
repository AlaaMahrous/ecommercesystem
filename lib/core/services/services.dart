import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Services> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync<Services>(() async => Services().init());
}
