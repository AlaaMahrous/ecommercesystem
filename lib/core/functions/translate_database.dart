import 'package:ecommercesystem/core/services/services.dart';
import 'package:get/get.dart';

String translateDatabase(String columnar, columnen) {
  Services services = Get.find();
  if (services.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
